//
//  ReminderPerspectiveEditCellView.swift
//  Reminder
//
//  Created by Ma Fo on 01.08.21.
//

import SwiftUI

struct ReminderPerspectiveEditCellView: View {
    
    var reminderPerspective: ReminderPerspective
    var iconSize: Font = .body
    
    var body: some View {
        HStack {
            IconView(systemName: reminderPerspective.icon, color: reminderPerspective.color)
                .font(iconSize)
            Text(reminderPerspective.name)
        }
    }
}

#if DEBUG
struct ReminderPerspectiveEditCellView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ForEach(allPersprectiveList) { item in
                ReminderPerspectiveEditCellView(reminderPerspective: item)
            }
        }
            .listStyle(InsetGroupedListStyle())
            .environment(\.editMode, Binding.constant(EditMode.active))
    }
}
#endif
