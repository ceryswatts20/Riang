//
//  History.swift
//  Riang
//
//  Created by Cerys Watts on 13/01/2023.
//

import SwiftUI

struct History: View {
    var body: some View {
        VStack {
            
            Text("History Page")
                .font(.title)
        }
        .scrollContentBackground(.hidden)
        .background(Image("Background-2"))
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
