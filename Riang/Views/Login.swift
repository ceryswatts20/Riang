//
//  Login.swift
//  Riang
//
//  Created by Cerys Watts on 13/01/2023.
//

import SwiftUI

struct Login: View {
    @State private var fName = ""
    @State private var surname = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        Form {
            TextField("First Name: ", text: $fName, prompt: Text("Required"))
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
            
            TextField(text: $surname, prompt: Text("Required")) {
                Text("Surname: ")
            }
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            
            TextField(text: $email, prompt: Text("Required")) {
                Text("Email: ")
            }
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            
            // Hides input text
            SecureField(text: $password, prompt: Text("Required")) {
                Text("Password")
            }
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            
            SecureField(text: $confirmPassword, prompt: Text("Required")) {
                Text("Confirm Password: ")
            }
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            
            Button("Submit") {
                if password.elementsEqual(confirmPassword) {
                    // Move on to settings
                }
                else {
                    // Warn passwords do not match
                }
            }
        }
    }
}


struct Login_Preview: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
