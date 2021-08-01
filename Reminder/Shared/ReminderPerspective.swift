//
//  ReminderPerspective.swift
//  Reminder
//
//  Created by Ma Fo on 01.08.21.
//

import SwiftUI

struct ReminderPerspective: Identifiable {
    var id = UUID()
    var name: String;
    var color: Color;
    var icon: String;
}

var allPersprectiveList: [ReminderPerspective] = [
    ReminderPerspective(name: "Heute", color: .blue, icon: "note"),
    ReminderPerspective(name: "Geplant", color: .red, icon: "calendar"),
    ReminderPerspective(name: "Alle", color: Color(UIColor.darkGray), icon: "tray.fill"),
    ReminderPerspective(name: "Markiert", color: .orange, icon: "flag.fill"),
    ReminderPerspective(name: "Mir zugewiesen", color: .green, icon: "person.fill"),
]
