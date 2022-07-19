//
//  HalfAppBannerView.swift
//  SwiftUI Test
//
//  Created by Isaac Marovitz on 19/07/2022.
//

import SwiftUI

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
                Text("Open")
                    .textCase(.uppercase)
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
