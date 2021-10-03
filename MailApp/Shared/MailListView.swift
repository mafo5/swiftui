//
//  MailListView.swift
//  MailApp
//
//  Created by Admin on 03.10.21.
//

import SwiftUI

struct MailFilter {
    let name: String
    let mailList: [Mail]
    
}

struct Mail: Identifiable {
    let id = UUID()
    let title: String
    let sender: String
    let preview: String
    let date: Date
    let attachement: Bool
    let reply: Bool
}

struct MailListItemView: View {
    let mail: Mail
    
    var body: some View {
        VStack (alignment: .leading) {
            NavigationLink(destination: Text("Destination")) {
                HStack {
                    Text(mail.sender)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .lineLimit(1)
                    Spacer()
                    Text("Today")
                        .foregroundColor(.gray)
                }
            }
            Text(mail.title)
                .lineLimit(1)
            Text(mail.preview)
                .foregroundColor(.gray)
                .lineLimit(2)
        }
    }
}

struct MailListView: View {
    
    let filter: MailFilter
    
    var body: some View {
        NavigationView {
            List(filter.mailList) { mail in
                MailListItemView(mail: mail)
            }
            .navigationTitle(filter.name)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    }
                    Spacer()
                    Text("just refreshed")
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Image(systemName: "square.and.pencil")
                    }
                }
            }
        }
    }
}

#if DEBUG
struct MailListView_Previews: PreviewProvider {
    static var previews: some View {
        MailListView(filter: MailFilter(
            name: "Alle",
            mailList: [
                Mail(
                    title: "something",
                    sender: "someone",
                    preview: "darkside",
                    date: Date(),
                    attachement: false,
                    reply: false
                ),
                Mail(
                    title: "something very very long so it will go over one line",
                    sender: "someone with a very long address",
                    preview: "a content field which is very long as well and will go over two lines to it will show that it ellipses",
                    date: Date(),
                    attachement: false,
                    reply: false
                ),
            ]
        ))
    }
}
#endif
