//
//  ContentView.swift
//  eplBoard
//
//  Created by macbook1 on 2022/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(schedules){ schedule in
                NavigationLink(schedule.title, value: schedule)
            }
            .navigationDestination(for: Schedule.self) { schedule in
                ScheduleView(schedule: schedule)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Schedule: Hashable, Identifiable {
    let id: String
    let title: String
}

let schedules = [
    Schedule(id: "1", title: "Tottenham"),
    Schedule(id: "2", title: "B"),
    Schedule(id: "3", title: "C")
]
