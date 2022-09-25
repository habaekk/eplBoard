//
//  Standings.swift
//  eplBoard
//
//  Created by macbook1 on 2022/09/26.
//

import Foundation

struct Standing {
    let position: Int
    let team_id: Int
    let team_name: String
}

struct Standings {
    let data: [Standing]
}

struct StandingsUpper {
    let data: [Standings]
}
