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
                   SidebarButtonView(title: "Home", iconName: "house")
                })
                .padding(.vertical)
                .buttonStyle(PlainButtonStyle())
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
                   SidebarButtonView(title: "App Library", iconName: "square.grid.2x2")
                })
                .padding(.vertical)
                .buttonStyle(PlainButtonStyle())
                NavigationLink(destination: {
                    IPAStoreView()
                        .navigationTitle("IPA Store")
                    
                }, label: {
                   SidebarButtonView(title: "IPA Store", iconName: "arrow.down.circle")
                })
                .padding(.vertical)
                .buttonStyle(PlainButtonStyle())
                NavigationLink(destination: {
                    SettingsView()
                        .navigationTitle("Settings")
                    
                }, label: {
                   SidebarButtonView(title: "Settings", iconName: "gear")
                })
                .padding(.vertical)
                .buttonStyle(PlainButtonStyle())
                NavigationLink(destination: {
                    AboutView()
                        .navigationTitle("About")
                    
                }, label: {
                   SidebarButtonView(title: "About", iconName: "info.circle")
                })
                .padding(.vertical)
                .buttonStyle(PlainButtonStyle())
                Spacer()
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

struct SidebarButtonView: View {
    let title: String
    let iconName: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20)
                .foregroundColor(.cyan)
            Text(title)
                .foregroundColor(.white)
            Spacer()
        }
    }
}

struct LargeAppBannerView: View {
    let appData: AppData
    
    var body: some View {
        HStack {
            Image(appData.iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(radius: 10)
                .padding(.all)
            VStack(alignment: .leading) {
                Text(appData.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("You've played a total of 31.2 hours of \(appData.name) this week, beating last week's record of 12.2 hours!")
                    .foregroundColor(.white)
                Spacer()
                    .frame(height: 20)
                Text("Ready to play again?")
                    .foregroundColor(.white)
                Text("OPEN")
                    .foregroundColor(.blue)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color(cgColor: .white))
                    )
            }
            .padding(.all)
            Spacer()
        }
        .background(LinearGradient(colors: [Color(hue: 180/360, saturation: 1, brightness: 0.8), Color(hue: 200/360, saturation: 1, brightness: 0.8)], startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 5)
    }
}

struct HalfAppBannerView: View {
    let appData: AppData
    let gradient: LinearGradient
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(appData.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text(appData.category.description)
                    .foregroundColor(.white)
                Spacer()
                    .frame(height: 10)
                Text("OPEN")
                    .foregroundColor(.blue)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(
                        RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color(cgColor: .white))
                    )
            }
            Spacer()
            Image(appData.iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                .shadow(radius: 10)
        }
        .padding(.horizontal)
        .frame(height: 100, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(gradient))
        .shadow(radius: 5)
    }
}

struct SmallAppBannerView: View {
    let appData: AppData
    
    var body: some View {
        HStack {
            Image(appData.iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .shadow(radius: 10)
            VStack(alignment: .leading) {
                Text(appData.name)
                Text(appData.version)
                    .foregroundColor(.gray)
            }
            Spacer()
            Text("GET")
                .foregroundColor(.blue)
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .background(
                    RoundedRectangle(cornerRadius: 20, style: .continuous).fill(Color(cgColor: .white))
                )
        }
        .frame(height: 50, alignment: .leading)
    }
}

struct HomeView: View {
    let GenshinImpact = AppData (name: "Genshin Impact", iconName: "Genshin", category: AppCategory.Games, version: "2.8.0")
    let AmongUs = AppData (name: "Among Us", iconName: "Among Us", category: AppCategory.Games, version: "1.0")
    let Twitch = AppData(name: "Twitch", iconName: "Twitch", category: AppCategory.Photo, version: "1.0")
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                LargeAppBannerView(appData: GenshinImpact)
                Spacer()
                    .frame(height: 20)
                HStack {
                    HalfAppBannerView(appData: AmongUs, gradient: LinearGradient(colors: [Color(hue: 50/360, saturation: 1, brightness: 0.8), Color(hue: 10/360, saturation: 1, brightness: 0.8)], startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing))
                    Spacer()
                        .frame(width: 20)
                    HalfAppBannerView(appData: Twitch, gradient: LinearGradient(colors: [Color(hue: 270/360, saturation: 1, brightness: 0.8), Color(hue: 290/360, saturation: 1, brightness: 0.8)], startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing))
                }
                Divider()
                    .padding(.vertical)
                HStack {
                    Text("Popular IPAs")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Spacer()
                    Text("See All")
                        .foregroundColor(.cyan)
                }
                HStack {
                    VStack {
                        SmallAppBannerView(appData: Twitch)
                        SmallAppBannerView(appData: GenshinImpact)
                        SmallAppBannerView(appData: Twitch)
                        SmallAppBannerView(appData: GenshinImpact)
                        SmallAppBannerView(appData: Twitch)
                        SmallAppBannerView(appData: GenshinImpact)
                    }
                    Spacer()
                        .frame(width: 40)
                    VStack {
                        SmallAppBannerView(appData: AmongUs)
                        SmallAppBannerView(appData: Twitch)
                        SmallAppBannerView(appData: Twitch)
                        SmallAppBannerView(appData: GenshinImpact)
                        SmallAppBannerView(appData: Twitch)
                        SmallAppBannerView(appData: GenshinImpact)
                    }
                }
            }
            .padding(.all)
        }
    }
}

struct AppLibraryView: View {
    var body: some View {
        ScrollView {
            // Toolbar buttons grid or list
            Text("App Library")
        }
    }
}

struct IPAStoreView: View {
    var body: some View {
        ScrollView {
            Text("IPA Store")
        }
    }
}

struct SettingsView: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Appearance")
                        
                    Spacer()
                    
                }
                Spacer()
                    .frame(height: 20)
                HStack {
                    Text("Accent Color")
                    Spacer()
                }
            }
            .padding(.all)
            Divider()
                .padding(.all)
            VStack {
                HStack {
                    Text("Discord RPC")
                        
                    Spacer()
                    
                }
                Spacer()
                    .frame(height: 20)
                HStack {
                    Text("Language")
                    Spacer()
                }
            }
            .padding(.all)
        }
    }
}

struct AboutView: View {
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Text("Ludere was created through the contributions of many developers and artists.")
                    Spacer()
                }
                Spacer()
                    .frame(height: 20)
                HStack {
                    Text("Discord @s, Modules used yayadada")
                    Spacer()
                }
                Spacer()
                    .frame(height: 20)
                HStack {
                    Text("discord, website, github links go here lol")
                }
            }
            .padding(.all)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
