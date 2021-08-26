//
//  CardView.swift
//  Health
//
//  Created by Ma Fo on 05.08.21.
//

import SwiftUI

struct CardView: View {
    
    var title: String?
    
    var body: some View {
        VStack {
            HStack {
                if (self.title != nil) {
                    Text(self.title!)
                        .bold()
                }
                Spacer()
                Button(action: {
                    debugPrint("Clicked Close")
                }) {
                    Image(systemName: "xmark")
                }
            }
                .padding(.horizontal)
                .padding(.top, 7)
                .font(.caption2)
                .foregroundColor(Color.gray)
            if (self.title != nil) {
                Rectangle()
                    .frame(height: 0.5, alignment: .top)
                    .foregroundColor(Color(UIColor.systemGray))
            }
            HStack (alignment: .top, spacing: 15) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 30, height: 30)
                VStack (alignment: .leading, spacing: 10) {
                    Text("Make sure the Health features on your iPhone are set up the way you want them.")
                        .bold()
                    Button("Review") {
                        
                    }
                }
                .font(.footnote)
            }
                .padding(.horizontal)
                .padding(.vertical, 10)
        }
        .background(Color(UIColor.systemBackground))
        .cornerRadius(10)
    }
}

#if DEBUG
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CardView(title: "HEALTH CHECKLIST")
                .padding()
        }
        .background(Color.gray)
    }
}
#endif
