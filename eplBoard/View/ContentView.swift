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

let informations = [
    Information()
]
