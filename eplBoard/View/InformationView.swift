//
//  ScheduleView.swift
//  eplBoard
//
//  Created by macbook1 on 2022/09/22.
//

import SwiftUI

struct InformationView: View {
    
    var viewModel = ViewModel()
    
    @State var information: Information
    
    var body: some View {
        VStack {
            Text(information.title)
            Text(String(information.id))
//            Text(information.short_code)
//            Text(String(information.founded))
//            Text(String(information.current_season_id))
//            AsyncImage(url: URL(string: information.logo_path))
        }
        .onAppear {
            
        }
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(information: Information())
    }
}
