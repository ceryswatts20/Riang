//
//  Main.swift
//  Riang
//
//  Created by Cerys Watts on 18/01/2023.
//

import SwiftUI

struct Main: View {
    @State public var history = false
    @State private var backgroundImage: Image = Image("Background-1")
    
    var body: some View {
        VStack {
            if history {
                HistoryView()
            }
            else {
                SettingsView()
            }
            
            Spacer()
            
            HStack {
                Spacer()
                
                Label("History", systemImage: "book").onTapGesture {
                    history = true
                }.foregroundColor(.blue).padding().fontWeight(.medium)
                
                Spacer()
                
                Label("Settings", systemImage: "gear").onTapGesture {
                    history = false
                }.foregroundColor(.blue).padding().fontWeight(.medium)
                
                Spacer()
            }
            .background(lightGreyColor)
            .cornerRadius(10)
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
                .fontWeight(.semibold)
            
            ScrollView {
                
                VStack {
                    Image("Temp Image").resizable().scaledToFit()
                    Image("Temp Image 2").resizable().scaledToFit()
                    // Add ad image
                    Image("Temp Image 3").resizable().scaledToFit()
                }
            }
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
