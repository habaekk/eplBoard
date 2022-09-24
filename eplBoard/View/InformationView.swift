//
//  ScheduleView.swift
//  eplBoard
//
//  Created by macbook1 on 2022/09/22.
//

import SwiftUI

struct InformationView: View {
    let information: Information
    var body: some View {
        Text(information.title)
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(information: Information(id: "0", title: "Z"))
    }
}
