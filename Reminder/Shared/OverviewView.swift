//
//  OverviewView.swift
//  Shared
//
//  Created by Ma Fo on 30.07.21.
//

import SwiftUI

struct OverviewView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State var editMode: EditMode = .inactive
    @State var reminderCollectionList: [ReminderCollection] = [
//        ReminderCollection(name: "Todo", color: .pink, icon: "list.dash", items: [ReminderListItem(name: "something")]),
//        ReminderCollection(name: "Erinnerungen", color: .orange, icon: "list.dash", items: [ReminderListItem(name: "something 1"), ReminderListItem(name: "something 2"), ReminderListItem(name: "something 3"), ReminderListItem(name: "something 4")]),
        ReminderCollection(name: "Reminders", color: .blue, icon: "list.dash", items: []),
    ]
    @State var persprectiveList: [ReminderPerspective] = allPersprectiveList
    @State var selectedPerspectiveList: Set<UUID> = [
        allPersprectiveList[0].id,
        allPersprectiveList[1].id,
        allPersprectiveList[2].id,
    ]
    @State private var editReminderCollection: ReminderCollection? = nil
    @State private var editReminderListItem: ReminderListItem? = nil
    
    var iconSize: Font = .caption
    
    var body: some View {
        NavigationView {
                VStack (alignment: .leading) {
                    if (editMode == EditMode.active) {
                        List(selection: $selectedPerspectiveList) {
                            ForEach(persprectiveList, id: \.id) { reminderPerspective in
                                ReminderPerspectiveEditCellView(reminderPerspective: reminderPerspective, iconSize: iconSize)
                            }
                            .onMove(perform: onMovePerspective)
                        }
                            .listStyle(InsetGroupedListStyle())
                    } else {
                        ReminderPerspectiveListView(reminderPerspectiveList: persprectiveList.filter({ (reminderPerspective) -> Bool in
                            selectedPerspectiveList.contains(reminderPerspective.id)
                        }), iconSize: iconSize)
                            .padding()
                    }
                    List {
                        Section(header: Text(NSLocalizedString("My Lists", comment: ""))
                                    .font(.system(.title2, design: .rounded))
                                    .foregroundColor(.primary)
                                    .bold()
                                    .padding(.leading)) {
                            ForEach(reminderCollectionList, id: \.id) { reminderCollection in
                                ReminderCollectionCellView(reminderCollection: reminderCollection, iconSize: iconSize)
                            }
                            .onDelete(perform: onDelete)
                            .onMove(perform: onMove)
                        }
                            .textCase(nil)
                    }
                        .listStyle(InsetGroupedListStyle())
                }
                
                // need toolbar because footer bar is not configurable otherwise
                .toolbar(content: {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button(action: {
                            print("New Reminder")
                            self.editReminderListItem = ReminderListItem(name: "")
                        }) {
                            HStack {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title)
                                Text("New Reminder")
                            }
                        }
                        // Spacer to push both buttons to each sides
                        Spacer()
                        Button("Add List") {
                            print("Add List")
                            self.editReminderCollection = ReminderCollection(name: "", color: .blue, icon: "list.dash")
                        }.sheet(item: $editReminderCollection) { detail in
                            EditReminderCollectionView(reminderCollection: detail)
                        }
                    }
                })
                .environment(\.editMode, $editMode)
                .background(colorScheme == .dark ? Color(UIColor.systemBackground) : Color(UIColor.secondarySystemBackground))
        }
    }
    
    private func onDelete(offsets: IndexSet) {
        reminderCollectionList.remove(atOffsets: offsets)
    }
    
    private func onMove(source: IndexSet, destination: Int) {
        reminderCollectionList.move(fromOffsets: source, toOffset: destination)
    }
    
    private func onMovePerspective(source: IndexSet, destination: Int) {
        persprectiveList.move(fromOffsets: source, toOffset: destination)
    }
}

#if DEBUG
struct OverviewView_Previews: PreviewProvider {
    static var previews: some View {
        OverviewView()
    }
}
#endif
