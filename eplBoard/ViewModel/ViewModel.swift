//
//  viewModel.swift
//  eplBoard
//
//  Created by macbook1 on 2022/09/24.
//

import Foundation

protocol FootballDelegate {
    func didUpdateFootball(_ viewmodel: ViewModel, information: Information)
    func didFailWithError(error: Error)

}

class ViewModel {
    
    private var urlFetcher  = urlManager()
    
    var delegate: FootballDelegate?
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let teams = self.parseJSON(safeData) {
                        let id: Int = teams.data[0].id
                        let title: String = teams.data[0].name
                        let short_code: String = teams.data[0].short_code
                        let founded: Int = teams.data[0].founded
                        let logo_path: String = teams.data[0].logo_path
                        let current_season_id: Int = teams.data[0].current_season_id
                        let info = Information(id: id, title: title, short_code: short_code, founded: founded, logo_path: logo_path, current_season_id: current_season_id)
                        self.delegate?.didUpdateFootball(self, information: info)
                        
                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ teamData: Data) -> TeamDetails? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(TeamDetails.self, from: teamData)
            return decodedData
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }

    func fetchTeamInformation(of teamName: String) {
        let temp_url = urlFetcher.search_team_by_name(teamName)
        print(temp_url)
        performRequest(with: temp_url)
    }
    
}
