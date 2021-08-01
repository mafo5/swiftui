//
//  EditReminderCollectionView.swift
//  Reminder
//
//  Created by Ma Fo on 30.07.21.
//

import SwiftUI

var colorPalette: [Color] = [
    .red, .orange, .yellow, .green, Color(UIColor.systemTeal), .blue,
    Color(UIColor.systemIndigo), .pink, .purple, Color(red: 0.6, green: 0.4, blue: 0.2), .gray, Color(UIColor.magenta),
]
var iconPalette: [String] = [
    "face.smiling", "list.dash", "bookmark.fill", "mappin", "gift", "cake",
    "graduationcap.fill", "bag", "pencil", "doc.fill", "book.fill", "tray.full.fill",
    "card", "money", "weights", "running", "fork", "wine",
    "pill", "doctor", "chair", "house", "company", "bank",
    "tent", "tv", "musik", "computer", "gamecontroller.fill", "headphones",
    "leaf", "carrot", "man", "man.two", "family", "paw",
    "bear", "fish", "basket", "cart", "bag", "parcel",
    "football", "baseball", "basketball", "football", "tennis", "tram.fill",
    "airplane", "boat", "car.fill", "umbrella", "sun.max.fill", "moon",
    "drop.fill", "snow", "flame.fill", "briefcase.fill", "wrench.and.screwdriver.fill", "scissors",
    "", "brackets", "ligthbulb.fill", "bubble.left.fill", "exclamationmark.2", "asterix",
    "rectangle.fill", "circle.fill", "triangle.fill", "diamond.fill", "heart.fill", "star.fill"
    
]

struct EditReminderCollectionView: View {
    @Environment(\.presentationMode) var presentation
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State var reminderCollection: ReminderCollection
    
    var body: some View {
        NavigationView {
            VStack {
                IconView(systemName: reminderCollection.icon, color: reminderCollection.color, paddingSize: 30)
                    .font(.largeTitle)
                TextField("", text: $reminderCollection.name)
                    .multilineTextAlignment(.leading)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                    .padding(.vertical)
                ScrollView {
                    GridListView(6, items: colorPalette) { color in
                        Circle()
                            .fill(color)
                            .frame(width: 50, height: 50)
                    }
                    GridListView(6, items: iconPalette) { icon in
                        IconView(systemName: icon, color: .gray)
                            .font(.title)
                            .frame(width: 50, height: 50)
                    }
                }
                    
            }
                .padding()
                .navigationBarItems(leading: Button("Abbrechen") {
                    print("Neue Liste Abbrechen")
                    self.presentation.wrappedValue.dismiss()
                }, trailing: Button("Fertig") {
                    print("Neue Liste Fertig")
                }.disabled(reminderCollection.name.count == 0))
        }
    }
}

#if DEBUG
struct EditReminderCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        EditReminderCollectionView(reminderCollection: ReminderCollection(name: "", color: .blue, icon: "list.dash"))
    }
}
#endif
