//
//  ReminderCollectionCellView.swift
//  Reminder
//
//  Created by Ma Fo on 01.08.21.
//

import SwiftUI

struct ReminderCollectionCellView: View {
    
    @Environment(\.editMode) var editMode: Binding<EditMode>?
    var reminderCollection: ReminderCollection
    var iconSize: Font = .body
    
    var body: some View {
        // need a hstack to keep the same element for edit mode change
        HStack {
            if (editMode?.wrappedValue == EditMode.inactive) {
                NavigationLink(destination: MyListsView(), label: {
                    IconView(systemName: reminderCollection.icon, color: reminderCollection.color)
                        .font(iconSize)
                    Text(reminderCollection.name)
                    Spacer()
                    Text("\(reminderCollection.items.count)")
                        .foregroundColor(.gray)
                })
            } else {
                IconView(systemName: reminderCollection.icon, color: reminderCollection.color)
                    .font(iconSize)
                Text(reminderCollection.name)
                Spacer()
                Button(action: {
                    print("Edit Liste")
                }) {
                    Image(systemName: "info.circle")
                }
                    .foregroundColor(.accentColor)
            }
        }
        .padding(.vertical, 5)
    }
}

#if DEBUG
struct ReminderCollectionCellView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            List {
                ReminderCollectionCellView(reminderCollection: ReminderCollection(name: "Reminders", color: .blue, icon: "list.dash", items: [
                    ReminderListItem(name: "Something"),
                    ReminderListItem(name: "Something"),
                ]))
                ReminderCollectionCellView(reminderCollection: ReminderCollection(name: "Todo", color: .red, icon: "list.dash"))
            }
                .listStyle(InsetGroupedListStyle())
            List {
                ReminderCollectionCellView(reminderCollection: ReminderCollection(name: "Reminders", color: .blue, icon: "list.dash"))
                ReminderCollectionCellView(reminderCollection: ReminderCollection(name: "Todo", color: .red, icon: "list.dash"))
            }
                .listStyle(InsetGroupedListStyle())
                .environment(\.editMode, Binding.constant(EditMode.active))
        }
    }
}
#endif
