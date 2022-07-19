//
//  AboutView.swift
//  SwiftUI Test
//
//  Created by Isaac Marovitz on 19/07/2022.
//

import SwiftUI

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

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
