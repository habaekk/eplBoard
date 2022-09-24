//
//  Information.swift
//  eplBoard
//
//  Created by macbook1 on 2022/09/25.
//

import Foundation

struct TeamDetail: Codable {
    var id: Int
    var name: String
    var short_code: String
    var founded: String
    var logo_path: String
    var current_season_id: Int
}

struct TeamDetails: Codable {
    var data: [TeamDetail]
}
