//
//  ContentView.swift
//  Shared
//
//  Created by Ma Fo on 30.07.21.
//

import SwiftUI

struct ReminderPerspective: Identifiable {
    var id = UUID()
    var name: String;
    var color: Color;
    var icon: String;
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

var allPersprectiveList: [ReminderPerspective] = [
    ReminderPerspective(name: "Heute", color: .blue, icon: "note"),
    ReminderPerspective(name: "Geplant", color: .red, icon: "calendar"),
    ReminderPerspective(name: "Alle", color: .gray, icon: "tray.fill"),
    ReminderPerspective(name: "Markiert", color: .orange, icon: "flag.fill"),
    ReminderPerspective(name: "Mir zugewiesen", color: .green, icon: "person.fill"),
]

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State var editMode: EditMode = .inactive
    @State var reminderCollectionList: [ReminderCollection] = [
        ReminderCollection(name: "Todo", color: .pink, icon: "list.dash", items: [ReminderListItem(name: "something")]),
        ReminderCollection(name: "Erinnerungen", color: .orange, icon: "list.dash", items: [ReminderListItem(name: "something 1"), ReminderListItem(name: "something 2"), ReminderListItem(name: "something 3"), ReminderListItem(name: "something 4")]),
        ReminderCollection(name: "Neue Liste", color: .blue, icon: "list.dash", items: [ReminderListItem(name: "something")]),
    ]
    @State var persprectiveList: [ReminderPerspective] = allPersprectiveList
    @State var selectedPerspectiveList: Set<UUID> = [
        allPersprectiveList[0].id,
        allPersprectiveList[1].id,
        allPersprectiveList[2].id,
    ]
    @State private var editReminderCollection: ReminderCollection? = nil
    @State private var editReminderListItem: ReminderListItem? = nil
    
    var listHeader: some View {
        Text("Meine Listen")
            .font(.system(.title2, design: .rounded))
            .foregroundColor(.primary)
            .bold()
            .padding(.leading)
    }
    
    func reminderListCell(reminderCollection: ReminderCollection) -> some View {
        // need a hstack to keep the same element for edit mode change
        HStack {
            if (editMode == EditMode.inactive) {
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
    }
    
    var iconSize: Font = .body
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 0) {
                if (editMode == EditMode.active) {
                    List(selection: $selectedPerspectiveList) {
                        ForEach(persprectiveList, id: \.id) { reminderPerspective in
                            HStack {
                                IconView(systemName: reminderPerspective.icon, color: reminderPerspective.color)
                                    .font(iconSize)
                                Text(reminderPerspective.name)
                            }
                        }
                        .onMove(perform: onMovePerspective)
                    }
                        .listStyle(InsetGroupedListStyle())
                } else {
                    GridListView(2, items: persprectiveList.filter({ (reminderPerspective) -> Bool in
                        selectedPerspectiveList.contains(reminderPerspective.id)
                    })) { reminderPerspective in
                        VStack (alignment: .leading, spacing: 10) {
                            HStack {
                                IconView(systemName: reminderPerspective.icon, color: reminderPerspective.color)
                                    .font(iconSize)
                                Spacer()
                                Text("0")
                                    .font(.title)
                                    .bold()
                            }
                            Text(reminderPerspective.name)
                        }
                            .padding()
                            .background(colorScheme == .dark ? Color(UIColor.secondarySystemBackground) : Color(UIColor.systemBackground))
                            .cornerRadius(10)
                        
                    }
                        .padding()
                        .background(colorScheme == .dark ? Color(UIColor.systemBackground) : Color(UIColor.secondarySystemBackground))
                }
                List {
                    Section(header: listHeader) {
                        ForEach(reminderCollectionList, id: \.id) { reminderCollection in
                            reminderListCell(reminderCollection: reminderCollection)
                        }
                        .onDelete(perform: onDelete)
                        .onMove(perform: onMove)
                    }
                        // remove capitalization of section header content
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
                        print("Neue Erinnerung")
                        self.editReminderListItem = ReminderListItem(name: "")
                    }) {
                        HStack {
                            Image(systemName: "plus.circle.fill")
                            Text("Neue Erinnerung")
                        }
                    }
                    // Spacer to push both buttons to each sides
                    Spacer()
                    Button("Neue Liste") {
                        print("Neue Liste")
                        self.editReminderCollection = ReminderCollection(name: "", color: .blue, icon: "list.dash")
                    }.sheet(item: $editReminderCollection) { detail in
                        EditReminderCollectionView(reminderCollection: detail)
                    }
                }
            })
            .environment(\.editMode, $editMode)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
