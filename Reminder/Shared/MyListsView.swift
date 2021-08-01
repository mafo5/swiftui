//
//  MyListsView.swift
//  Reminder
//
//  Created by Ma Fo on 30.07.21.
//

import SwiftUI

struct Ocean: Identifiable, Hashable {
    let name: String
    let id = UUID()
}

struct MyListsView: View {
    private var oceans = [
        Ocean(name: "Pacific"),
        Ocean(name: "Atlantic"),
        Ocean(name: "Indian"),
        Ocean(name: "Southern"),
        Ocean(name: "Arctic")
    ]
    @State private var multiSelection = Set<UUID>()

    var body: some View {
        NavigationView {
            List(oceans, selection: $multiSelection) {
                Text($0.name)
            }
            .navigationTitle("Oceans")
            .toolbar { EditButton() }
        }
        Text("\(multiSelection.count) selections")
    }
}

#if DEBUG
struct MyListsView_Previews: PreviewProvider {
    static var previews: some View {
        MyListsView()
    }
}
#endif
