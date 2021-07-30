//
//  CreateListView.swift
//  Reminder
//
//  Created by Ma Fo on 30.07.21.
//

import SwiftUI

struct CreateListView: View {
    var body: some View {
        VStack {
            Group {
                HStack {
                    Spacer()
                    IconView(systemName: "list.dash", color: .green)
                        .font(.custom("huge", size: 120, relativeTo: .title))
                    Spacer()
                }
                TextField(/*@START_MENU_TOKEN@*/"Placeholder"/*@END_MENU_TOKEN@*/, text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .padding()
            }.padding()
            ScrollView {
                HStack {
                    VStack {
                        Circle()
                            .background(Color.red)
                    }
                }
            }
        }
    }
}

struct CreateListView_Previews: PreviewProvider {
    static var previews: some View {
        CreateListView()
    }
}
