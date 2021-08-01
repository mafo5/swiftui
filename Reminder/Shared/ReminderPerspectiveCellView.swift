//
//  ReminderCollectionCellView.swift
//  Reminder
//
//  Created by Ma Fo on 01.08.21.
//

import SwiftUI

struct ReminderPerspectiveCellView: View {

    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var reminderPerspective: ReminderPerspective
    var iconSize: Font = .body
    
    var body: some View {
        VStack (alignment: .leading, spacing: 10) {
            HStack {
                IconView(systemName: reminderPerspective.icon, color: reminderPerspective.color)
                    .font(iconSize)
                Spacer()
                Text("0")
                    .font(.largeTitle)
                    .bold()
            }
            Text(reminderPerspective.name)
                .bold()
                .foregroundColor(.gray)
        }
            .padding()
            .background(colorScheme == .dark ? Color(UIColor.secondarySystemBackground) : Color(UIColor.systemBackground))
            .cornerRadius(10)
    }
}

#if DEBUG
struct ReminderPerspectiveCellView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ReminderPerspectiveCellView(reminderPerspective: ReminderPerspective(name: "Today", color: .blue, icon: "note"))
                .padding()
        }.background(Color.gray)
    }
}
#endif
