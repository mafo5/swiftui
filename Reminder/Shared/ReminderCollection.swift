//
//  ReminderList.swift
//  Reminder
//
//  Created by Ma Fo on 30.07.21.
//

import SwiftUI

struct ReminderCollection: Identifiable {
    var id = UUID()
    var name: String
    var color: Color
    var icon: String
    var items: [ReminderListItem] = []
}

struct ReminderListItem: Identifiable {
    var id = UUID()
    var name: String
}
