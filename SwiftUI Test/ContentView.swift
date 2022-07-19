//
//  ContentView.swift
//  SwiftUI Test
//
//  Created by Isaac Marovitz on 18/07/2022.
//

import SwiftUI

enum AppCategory : CustomStringConvertible {
    case Business, Entertainment, Graphics, Medical, Photo, Travel, Dev, Finance, Health, Music, Productivity, Social, Utilities, Education, Games, Lifestyle, News, Reference, Sports, Weather
    
    var description: String {
        switch self {
        case .Business: return "Buisness"
        case .Entertainment: return "Entertainment"
        case .Graphics: return "Graphics & Design"
        case .Medical: return "Medical"
        case .Photo: return "Photo & Video"
        case .Travel: return "Travel"
        case .Dev: return "Developer Tools"
        case .Finance: return "Finance"
        case .Health: return "Health & Fitness"
        case .Music: return "Music"
        case .Productivity: return "Productivity"
        case .Social: return "Social Networking"
        case .Utilities: return "Utilities"
        case .Education: return "Education"
        case .Games: return "Games"
        case .Lifestyle: return "Lifestyle"
        case .News: return "News"
        case .Reference: return "Reference"
        case .Sports: return "Sports"
        case .Weather: return "Weather"
        }
    }
}

struct AppData: Hashable {
    let name: String
    let iconName: String
    let category: AppCategory
    let version: String
}

struct ContentView: View {
    var body: some View {
        // Deprecated
        NavigationView {
            List {
                NavigationLink(destination: {
                    HomeView()
                        .navigationTitle("Home")
                }, label: {
                   Label("Home", systemImage: "house")
                })
                Section(header: Text("PlayCover")) {
                    NavigationLink(destination: {
                        AppLibraryView()
                            .navigationTitle("App Library")
                            .toolbar {
                                ToolbarItem(placement: .primaryAction) {
                                    Button(action: {}, label: {
                                        Image(systemName: "square.grid.2x2")
                                    })
                                }
                                ToolbarItem(placement: .primaryAction) {
                                    Button(action: {}, label: {
                                        Image(systemName: "list.bullet")
                                    })
                                }
                            }
                        
                    }, label: {
                        Label("App Library", systemImage: "square.grid.2x2")
                    })
                    NavigationLink(destination: {
                        IPAStoreView()
                            .navigationTitle("IPA Store")
                        
                    }, label: {
                        Label("IPA Store", systemImage: "arrow.down.circle")
                    })
                    NavigationLink(destination: {
                        SettingsView()
                            .navigationTitle("Settings")
                        
                    }, label: {
                        Label("Settings", systemImage: "gear")
                    })
                }
                
                Section(header: Text("Help & Support")) {
                    NavigationLink(destination: {
                        FAQView()
                            .navigationTitle("FAQs")
                        
                    }, label: {
                        Label("FAQs", systemImage: "questionmark.circle")
                    })
                    NavigationLink(destination: {
                        AboutView()
                            .navigationTitle("About")
                        
                    }, label: {
                        Label("About", systemImage: "info.circle")
                    })
                }
            }
            HomeView()
        }
        .frame(minWidth: 800, minHeight: 500)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: toggleSidebar, label: {
                    Image(systemName: "sidebar.leading")
                })
            }
        }
        .navigationTitle("Home")

    }
    
    private func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
