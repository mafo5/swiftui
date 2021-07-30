//
//  IconView.swift
//  Reminder
//
//  Created by Ma Fo on 30.07.21.
//

import SwiftUI

struct IconView: View {
    var systemName: String
    var color: Color
    var paddingSize: CGFloat = 10
    var body: some View {
            Image(systemName: systemName)
                .foregroundColor(.white)
                .padding(paddingSize)
                .background(
                    GeometryReader { metrics in
                        Circle()
                            .fill(color)
                    }
                )
        
    }
}

#if DEBUG
struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            IconView(systemName: "eye.slash", color: .red)
                .font(.caption)
                .padding()
            IconView(systemName: "list.dash", color: .green)
            IconView(systemName: "eye", color: .blue)
                .font(.title)
        }
    }
}
#endif
