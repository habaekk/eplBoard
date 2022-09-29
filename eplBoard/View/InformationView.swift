//
//  ScheduleView.swift
//  eplBoard
//
//  Created by macbook1 on 2022/09/22.
//

import SwiftUI

struct InformationView: View, FootballDelegate {
    
    var viewModel = ViewModel()
    
    @ObservedObject private var show = Show()
    @State var teamInfo: TeamInfo
    @State var information: Information
    
    var body: some View {
        VStack {
            Text(information.title)
            if show.show {
                Text(String(teamInfo.id))
//                Text(teamInfo.short_code)
                Text(String(teamInfo.founded))
                Text(String(teamInfo.current_season_id))
                AsyncImage(url: URL(string: teamInfo.logo_path))
            }
        }
        .onAppear {
            viewModel.delegate = self
            viewModel.fetchTeamInformation(of: information.title)
        }
    }
    
    
    func didUpdateFootball(_ viewmodel: ViewModel, information: Information) {
        
    }
    
    func didUpdateFootball(_ viewmodel: ViewModel, teamInfo: TeamInfo) {
        self.teamInfo = teamInfo
        DispatchQueue.main.async {
            show.show = true
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(teamInfo: TeamInfo(), information: Information())
    }
}

class Show: ObservableObject {
    @Published var show: Bool = false
}
