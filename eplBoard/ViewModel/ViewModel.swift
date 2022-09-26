//
//  viewModel.swift
//  eplBoard
//
//  Created by macbook1 on 2022/09/24.
//

import Foundation

protocol FootballDelegate {
    func didUpdateFootball(_ viewmodel: ViewModel, information: Information)
    func didUpdateFootball(_ viewmodel: ViewModel, teamInfo: TeamInfo)
    func didFailWithError(error: Error)

}

class ViewModel {
    
    private var urlFetcher  = urlManager()
    
    var delegate: FootballDelegate?
    
    func performRequestTeamInfo(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let teams = self.parseJSONTeamInfo(safeData) {
                        let id: Int = teams.data[0].id
                        let title: String = teams.data[0].name
//                        let short_code: String = teams.data[0].short_code
                        let founded: Int = teams.data[0].founded
                        let logo_path: String = teams.data[0].logo_path
                        let current_season_id: Int = teams.data[0].current_season_id
                        let info = TeamInfo(id: id, title: title, founded: founded, logo_path: logo_path, current_season_id: current_season_id)
                        self.delegate?.didUpdateFootball(self, teamInfo: info)
                        
                    }
                }
            }
            task.resume()
        }
    }
    
    func performRequestStandings(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let JSONdata = self.parseJSONStandings(safeData) {
                        let standings = JSONdata.data[0].standings.data
                        for team in standings {
//                            let position: Int = team.position
                            let id: Int = team.team_id
                            let name: String = team.team_name
                            
//                            let points: Int = team.points
                            
//                            let info = Information(id: id, title: title, short_code: short_code, founded: founded, logo_path: logo_path, current_season_id: current_season_id)
                            let info = Information(id: id, title: name)
                            self.delegate?.didUpdateFootball(self, information: info)
                        }
                        
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSONTeamInfo(_ teamData: Data) -> TeamDetails? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(TeamDetails.self, from: teamData)
            return decodedData
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    func parseJSONStandings(_ teamData: Data) -> StandingsAbove? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(StandingsAbove.self, from: teamData)
            return decodedData
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }


    func fetchTeamInformation(of teamName: String) {
        let temp_url = urlFetcher.search_team_by_name(teamName)
        performRequestTeamInfo(with: temp_url)
    }
    
    func fetchTeamStandings() {
        let temp_url = urlFetcher.get_standings_by_season_id()
        performRequestStandings(with: temp_url)
    }
    
    func appendInformation(_ info: Information) {
        informations.append(info)
    }
    
}
