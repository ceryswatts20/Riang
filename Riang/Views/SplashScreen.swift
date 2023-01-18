//
//  SplashScreen.swift
//  Riang
//
//  Created by Cerys Watts on 13/01/2023.
//

import SwiftUI

struct SplashScreen: View {
    @State var isActive: Bool = false
    
    var body: some View {
        VStack {
            if self.isActive {
                Login()
            } else {
                LogoView()
                Text("Riang")
                    .font(.title)
                    .fontWeight(.semibold)
            }
        }
        .padding()
        .background(Image("Background-5"))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashScreen_Preview: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}

struct LogoView: View {
    var body: some View {
        return Image("Logo")
            .resizable()
            .aspectRatio(UIImage(named: "Logo")!.size, contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}
