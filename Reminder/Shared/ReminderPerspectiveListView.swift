//
//  ReminderPerspectiveListView.swift
//  Reminder
//
//  Created by Ma Fo on 01.08.21.
//

import SwiftUI

struct ReminderPerspectiveListView: View {
    
    var reminderPerspectiveList: [ReminderPerspective]
    var iconSize: Font = .body
    
    var body: some View {
        GridListView(2, items: reminderPerspectiveList) { reminderPerspective in
            ReminderPerspectiveCellView(reminderPerspective: reminderPerspective, iconSize: iconSize)
        }
    }
}

#if DEBUG
struct ReminderPerspectiveListView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            ReminderPerspectiveListView(reminderPerspectiveList: [
                ReminderPerspective(name: "Today", color: .blue, icon: "note"),
                ReminderPerspective(name: "Scheduled", color: .red, icon: "calendar"),
                ReminderPerspective(name: "All", color: Color(UIColor.darkGray), icon: "tray.fill"),
            ])
                .padding()
        }
            .background(Color.gray)
    }
}
#endif
