//
//  HomeView.swift
//  SwiftUI Test
//
//  Created by Isaac Marovitz on 19/07/2022.
//

import SwiftUI

struct HomeView: View {
    let GenshinImpact = AppData (name: "Genshin Impact", iconName: "Genshin", category: AppCategory.Games, version: "2.8.0")
    let GenshinCN = AppData (name: "原神", iconName: "Genshin", category: AppCategory.Games, version: "2.8.0")
    let AmongUs = AppData (name: "Among Us!", iconName: "Among Us", category: AppCategory.Games, version: "2022.7.6")
    let Twitch = AppData(name: "Twitch", iconName: "Twitch", category: AppCategory.Photo, version: "13.3")
    let YouTube = AppData(name: "YouTube", iconName: "YouTube", category: AppCategory.Photo, version: "17.28.2")
    
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
                    Text("Recently Opened Apps")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Spacer()
                    Text("See All")
                        .foregroundColor(.cyan)
                }
                HStack {
                    VStack {
                        SmallAppBannerView(appData: Twitch)
                        SmallAppBannerView(appData: GenshinCN)
                        SmallAppBannerView(appData: Twitch)
                        SmallAppBannerView(appData: GenshinImpact)
                        SmallAppBannerView(appData: Twitch)
                        SmallAppBannerView(appData: GenshinImpact)
                    }
                    Spacer()
                        .frame(width: 40)
                    VStack {
                        SmallAppBannerView(appData: AmongUs)
                        SmallAppBannerView(appData: YouTube)
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
