//
//  Request.swift
//  eplBoard
//
//  Created by macbook1 on 2022/09/25.
//

import Foundation

struct Request {
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    if let teams = Parsing.parseJSON(safeData) {
                        return
                    }
                }
            }
            task.resume()
        }
    }
}
