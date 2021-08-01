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
    let spacing: CGFloat
    
    init(_ grid: Int, items: [Item], spacing: CGFloat = 20, @ViewBuilder content: @escaping (Item) -> Content) {
        self.grid = grid
        self.items = items
        self.content = content
        self.spacing = spacing
    }
    
    var body: some View {
        VStack (spacing: spacing) {
            ForEach(Array(items.chunked(into: grid).enumerated()), id: \.offset) { rowIndex, chunk in
                HStack (spacing: spacing) {
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
        HStack {
            GridListView(2, items: [TestItem(), TestItem(), TestItem()], spacing: 10) { item in
                HStack {
                    VStack {
                        Text("Item \(item.id)")
                    }
                }
                    .background(Color.gray)
            }
                .padding()
        }
    }
}
#endif
