//
//  LargeAppBannerView.swift
//  SwiftUI Test
//
//  Created by Isaac Marovitz on 19/07/2022.
//

import SwiftUI

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
