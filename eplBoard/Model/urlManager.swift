//
//  url.swift
//  eplBoard
//
//  Created by macbook1 on 2022/09/24.
//

import Foundation

struct urlManager {
    
    func attach_api_token(_ url: String) -> String {
        return "\(url)?\(token.api_token)"
    }
    
    func get_teams_by_season_id() -> String {
        let temp_url = "https://soccer.sportmonks.com/api/v2.0/teams/season/\(K.api.season_id_premiership_2022_2023)"
        return attach_api_token(temp_url)
    }
}
