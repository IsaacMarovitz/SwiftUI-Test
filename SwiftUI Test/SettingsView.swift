//
//  SettingsView.swift
//  SwiftUI Test
//
//  Created by Isaac Marovitz on 19/07/2022.
//

import SwiftUI

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

struct SettignsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
