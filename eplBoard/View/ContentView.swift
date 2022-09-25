//
//  ContentView.swift
//  eplBoard
//
//  Created by macbook1 on 2022/09/22.
//

import SwiftUI

struct ContentView: View {
    
    var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            List(informations){ information in
                NavigationLink(information.title, value: information)
            }
            .navigationDestination(for: Information.self) { information in
                InformationView(information: information)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Information: Hashable, Identifiable {
    let id: String
    let title: String
}

let informations = [
    Information(id: "1", title: "Celtic"),
    Information(id: "2", title: "Rangers"),
    Information(id: "3", title: "Hearts")
]
