//
//  SplashScreen.swift
//  Riang
//
//  Created by Cerys Watts on 13/01/2023.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundColor(.accentColor)
            Text("Riang")
        }
        .padding()
        
        
    }
}

struct SplashScreen_Preview: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
