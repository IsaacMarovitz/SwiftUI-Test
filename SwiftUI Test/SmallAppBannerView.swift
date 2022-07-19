//
//  SmallAppBannerView.swift
//  SwiftUI Test
//
//  Created by Isaac Marovitz on 19/07/2022.
//

import SwiftUI

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
            Text("Open")
                .textCase(.uppercase)
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
