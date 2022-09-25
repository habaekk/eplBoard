//
//  ScheduleView.swift
//  eplBoard
//
//  Created by macbook1 on 2022/09/22.
//

import SwiftUI

struct InformationView: View, FootballDelegate {
    
    var viewModel = ViewModel()
    
    let information: Information
    
    
    var body: some View {
        VStack {
            Text(information.title)
                .onAppear {
                    viewModel.delegate = self
                    viewModel.performRequest(with: "www")
            }
            Text("id")
            Text("name")
            Text("short_code")
            Text("founded")
            AsyncImage(url: URL(string: "https://www.hackingwithswift.com/img/paul.png"))
        }
        
    }
    
    
    func didUpdateFootball(_ viewmodel: ViewModel, information: Information) {
        let a = 1
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(information: Information())
    }
}
