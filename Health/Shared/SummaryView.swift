//
//  SummaryView.swift
//  Health
//
//  Created by Ma Fo on 05.08.21.
//

import SwiftUI

struct SummaryView: View {
    
    var body: some View {
        NavigationView {
            List {
                CardView()
                Section (header:
                            HStack (alignment: .bottom) {
                            Text("Favorites")
                                .bold()
                                .font(.title3)
                                .foregroundColor(Color.primary)
                            Spacer()
                            Button(action: {
                                
                            }) {
                                Text("Edit")
                            }
                        }) {
                    VStack (spacing: 20) {
                        NavigationLink(destination: DetailView()) {
                            HStack (spacing: 3) {
                                Image(systemName: "flame.fill")
                                Text("Steps").bold()
                                Spacer()
                            }
                            .foregroundColor(.red)
                            
                        }
                        HStack {
                            Text("No Data")
                                .foregroundColor(Color.gray)
                                .bold()
                                .font(.body)
                            Spacer()
                        }
                    }
                    .padding(.vertical, 5)
                }
                .textCase(nil)
                Section {
                    NavigationLink(destination: DetailView()) {
                        HStack {
                            Text("Show All Health Data")
                                .foregroundColor(Color.accentColor)
                                .font(.footnote)
                            Spacer()
                        }
                    }
                }
                .textCase(nil)
                .onAppear(perform: {
                    UITableView.appearance().contentInset.top = -16
                  })
                  .onDisappear(perform: {
                    UITableView.appearance().contentInset.top = 0
                  })
                Section (header:
                    Text("Get More From Health")
                        .bold()
                            .font(.title3)
                        .foregroundColor(Color.primary)) {
                    VStack (alignment: .leading) {
                        HStack {
                            Spacer()
                            Image(systemName: "xmark")
                                .foregroundColor(.gray)
                        }
                        HStack {
                            Spacer()
                            Image(systemName: "staroflife.fill")
                                .font(.largeTitle)
                                .foregroundColor(.red)
                                .background(
                                    Circle()
                                        .fill(Color.gray)
                                        .frame(width: 80, height: 80)
                                )
                                .frame(width: 100, height: 100)
                            Spacer()
                        }
                            
                        Text("Set Up Your Medical ID")
                            .bold()
                            .font(.title3)
                        Text("In an emergency, first responders can look at you Medical ID to get life-saving information.")
                        Button(action: {}) {
                            HStack {
                                Spacer()
                                Text("Get Started")
                                    .foregroundColor(.white)
                                    .bold()
                                    .padding(12)
                                Spacer()
                            }
                        }
                            .background(Color.blue)
                            .cornerRadius(8)
                            .padding(.vertical, 8)
                    }
                    .background(Color.white)
                }
                .textCase(nil)
                Section {
                    VStack (alignment: .leading) {
                        HStack {
                            Spacer()
                            Image(systemName: "xmark")
                                .foregroundColor(.gray)
                        }
                        HStack {
                            Spacer()
                            Image(systemName: "staroflife.fill")
                                .font(.largeTitle)
                                .foregroundColor(.red)
                                .background(
                                    Circle()
                                        .fill(Color.gray)
                                        .frame(width: 80, height: 80)
                                )
                                .frame(width: 100, height: 100)
                            Spacer()
                        }
                            
                        Text("Set Up Sleep")
                            .bold()
                            .font(.body)
                        Text("Your devices can help you get better sleep and understand your sleep patterns.")
                            .font(.subheadline)
                        Button(action: {}) {
                            HStack {
                                Spacer()
                                Text("Get Started")
                                    .foregroundColor(.white)
                                    .bold()
                                    .padding(12)
                                Spacer()
                            }
                        }
                            .background(Color.blue)
                            .cornerRadius(8)
                            .padding(.vertical, 8)
                    }
                    .background(Color.white)
                }
                .textCase(nil)
                
            }
            .font(.footnote)
            .listStyle(InsetGroupedListStyle())
            .background(Color(UIColor.secondarySystemBackground))
            .navigationTitle(Text("Summary"))
        }
    }
}

#if DEBUG
struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
#endif
