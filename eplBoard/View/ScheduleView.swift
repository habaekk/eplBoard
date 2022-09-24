//
//  ScheduleView.swift
//  eplBoard
//
//  Created by macbook1 on 2022/09/22.
//

import SwiftUI

struct ScheduleView: View {
    let schedule: Schedule
    var body: some View {
        Text(schedule.title)
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView(schedule: Schedule(id: "0", title: "Z"))
    }
}
