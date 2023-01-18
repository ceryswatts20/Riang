//
//  Settings.swift
//  Riang
//
//  Created by Cerys Watts on 13/01/2023.
//

import SwiftUI

struct Settings: View {
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

struct Settings_Preview: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
