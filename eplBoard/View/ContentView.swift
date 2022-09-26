//
//  ContentView.swift
//  eplBoard
//
//  Created by macbook1 on 2022/09/22.
//

import SwiftUI

struct ContentView: View, FootballDelegate{
    
    @State private var progress = 0.0
    var viewModel = ViewModel()
    
    var body: some View {
        ProgressView(value: progress)
        NavigationStack {
            List(informations){ information in
                NavigationLink(information.title, value: information)
            }
            .navigationDestination(for: Information.self) { information in
                InformationView(teamInfo: TeamInfo(), information: information)
            }
        }.onAppear {
            viewModel.delegate = self
            viewModel.fetchTeamStandings()
        }
        
    }
    
    func didUpdateFootball(_ viewmodel: ViewModel, information: Information) {
        viewModel.appendInformation(information)
        progress += 1/12
    }
    
    func didUpdateFootball(_ viewmodel: ViewModel, teamInfo: TeamInfo) {
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

