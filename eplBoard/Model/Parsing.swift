//
//  Parsing.swift
//  eplBoard
//
//  Created by macbook1 on 2022/09/25.
//

import Foundation

struct Parsing {
    static func parseJSON(_ teamData: Data) -> TeamDetails? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(TeamDetails.self, from: teamData)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
}
