//
//  AccountListView.swift
//  MailApp
//
//  Created by Admin on 03.10.21.
//

import SwiftUI

struct Account: Identifiable {
    let id = UUID()
    let name: String
    let folderList: [MailFolder]
}

struct MailFolder: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
}

struct AccountListItemView: View {
    private var name: String
    private var icon: String
    private var iconColor: Color
    
    init(name: String, icon: String = "tray", iconColor: Color = Color.accentColor) {
        self.name = name
        self.icon = icon
        self.iconColor = iconColor
    }
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(iconColor)
            Text(name)
        }
    }
}

struct AccountListView: View {
    
    let accountList: [Account]
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: MailListView(filter: MailFilter(name: "All", mailList: []))) {
                    AccountListItemView(name: "All", icon: "tray.2")
                }
                ForEach(0..<accountList.count) { accountIndex in
                    NavigationLink(destination: Text(verbatim: "destination")) {
                        AccountListItemView(name: accountList[accountIndex].name)
                    }
                }
                NavigationLink(destination: Text("destination")) {
                    AccountListItemView(name: "VIP", icon: "star", iconColor: Color.yellow)
                }
                
                ForEach(0..<accountList.count) { accountIndex in
                    let account = accountList[accountIndex]
                    Section(header: Text(account.name)) {
                        ForEach(0..<account.folderList.count) { folderIndex in
                            let folder = account.folderList[folderIndex]
                            NavigationLink(destination: Text(verbatim: "destination")) {
                                AccountListItemView(
                                    name: folder.name,
                                    icon: folder.icon
                                )
                            }
                        }
                    }
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle("Accounts")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItemGroup(placement: .bottomBar) {
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
struct AccountListView_Previews: PreviewProvider {
    static var previews: some View {
        AccountListView(accountList: [
            Account(name: "iCloud", folderList: [
                MailFolder(name: "Inbox", icon: "tray"),
                MailFolder(name: "Send", icon: "paperplane"),
            ])
        ])
    }
}
#endif
