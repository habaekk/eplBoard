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
                        let id = String(teams.data[0].id)
                        let title = teams.data[0].name
                        let info = Information(id: id, title: title)
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

    
}
