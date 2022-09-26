//
//  Standings.swift
//  eplBoard
//
//  Created by macbook1 on 2022/09/26.
//

import Foundation

struct Team: Codable {
    let position: Int
    let team_id: Int
    let team_name: String
    
    let points: Int
}

struct Standings: Codable {
    let data : [Team]
}

struct StandingsBelow: Codable {
    let standings: Standings
}

struct StandingsAbove: Codable {
    let data: [StandingsBelow]
}
