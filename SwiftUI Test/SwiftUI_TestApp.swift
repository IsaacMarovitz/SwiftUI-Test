//
//  SwiftUI_TestApp.swift
//  SwiftUI Test
//
//  Created by Isaac Marovitz on 18/07/2022.
//

import SwiftUI

@main
struct SwiftUI_TestApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.commands {
            SidebarCommands()
        }
    }
}
