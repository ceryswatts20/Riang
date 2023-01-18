//
//  Main.swift
//  Riang
//
//  Created by Cerys Watts on 18/01/2023.
//

import SwiftUI

struct Main: View {
    @State public var selectedTab = ""
    
    var body: some View {
        TabView(selection: $selectedTab) {
            History().tabItem { Label("History", systemImage: "book") }.tag("history")
            Settings().tabItem { Label("Settings", systemImage: "gear") }.tag("settings")
        }.scrollContentBackground(.hidden)
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
