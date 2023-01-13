//
//  MainScene.swift
//  Riang
//
//  Created by Cerys Watts on 13/01/2023.
//

import SwiftUI

struct MainScene: Scene {
    var body: some Scene {
        WindowGroup {
            TabView {
                History().tabItem() {
                    Label("History", systemImage: "book")
                }
                
                Settings().tabItem() {
                    Label("Settings", systemImage: "settings")
                }
            }
        }
    }
}
