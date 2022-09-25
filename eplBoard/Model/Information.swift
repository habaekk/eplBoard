//
//  Information.swift
//  eplBoard
//
//  Created by macbook1 on 2022/09/25.
//

import Foundation

struct Information: Hashable, Identifiable {
    var id: Int = 0
    var title: String = "title"
    var short_code: String = "SHORT_CODE"
    var founded: Int = 2022
    var logo_path: String = "www"
    var current_season_id: Int = 0
}
