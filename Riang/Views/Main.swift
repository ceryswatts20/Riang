//
//  Main.swift
//  Riang
//
//  Created by Cerys Watts on 18/01/2023.
//

import SwiftUI


struct Main: View {
    @State public var selectedTab = ""
    @State private var backgroundImage: Image = Image("Background-1")
    @State public var history = false
    
    var body: some View {
        VStack {
            if history {
                HistoryView()
            }
            else {
                SettingsView()
            }
            
            HStack {
                Label("History", systemImage: "book").onTapGesture {
                    history = true
                }
                Spacer()
                Label("Settings", systemImage: "gear").onTapGesture {
                    history = false
                }
            }
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}

struct HistoryView: View {
    var body: some View {
        VStack {
            Text("History Page")
                .font(.title)
        }
        .scrollContentBackground(.hidden)
        .background(Image("Background-2"))
    }
}

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Settings")
                .font(.title)
                .fontWeight(.semibold)
            
            Form {
                // Add navigation link
                HStack {
                    Text("Account")
                }
                HStack {
                    Text("Logout")
                }
                
                HStack {
                    Text("Camera Roll")
                }
            }
            .scrollContentBackground(.hidden)
        }
        .background(Image("Background-6"))
    }
}
