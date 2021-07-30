//
//  GridListView.swift
//  Reminder
//
//  Created by Ma Fo on 30.07.21.
//

import SwiftUI

struct GridListView<Item, Content: View>: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    let grid: Int
    let items: [Item]
    let content: (Item) -> Content
    
    init(_ grid: Int, items: [Item], @ViewBuilder content: @escaping (Item) -> Content) {
        self.grid = grid
        self.items = items
        self.content = content
    }
    
    var body: some View {
        VStack (spacing: 10) {
            ForEach(Array(items.chunked(into: grid).enumerated()), id: \.offset) { rowIndex, chunk in
                HStack (spacing: 10) {
                    ForEach (Array(chunk.enumerated()), id: \.offset) { colIndex, item in
                        content(item)
                    }
                }
            }
        }
    }
}

#if DEBUG
struct TestItem: Identifiable {
    var id = UUID()
}

struct GridListView_Previews: PreviewProvider {
    static var previews: some View {
        GridListView(2, items: [TestItem(), TestItem(), TestItem()]) { item in
            Text("Item \(item.id)")
        }
    }
}
#endif
