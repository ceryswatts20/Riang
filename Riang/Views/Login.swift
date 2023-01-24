//
//  Login.swift
//  Riang
//
//  Created by Cerys Watts on 17/01/2023.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
let storedEmail = "Myusername"
let storedPassword = "Mypassword"

struct Login: View {
    @State private var email = ""
    @State private var password = ""
    @State private var authenticationDidFail = false
    @State private var authenticationDidSucceed = false
    @State private var createAccount = false
    
    var body: some View {
        VStack {
            if createAccount {
                // Open CreateAccount page
                CreateAccount()
            } else if authenticationDidSucceed {
                // Open History page
                Main(selectedTab: "history")
            } else {
                Text("Welcome!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.bottom, 20)
                UserImage()
                
                EmailTextField(email: $email)
                PasswordSecureField(password: $password)
                
                if authenticationDidFail {
                    Text("Information not correct. Try again.")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                
                Button(action: {
                    if self.email == storedEmail && self.password == storedPassword {
                        self.authenticationDidSucceed = true
                        self.authenticationDidFail = false
                    } else {
                        self.authenticationDidFail = true
                        self.authenticationDidSucceed = false
                    }
                }) {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.green)
                        .cornerRadius(15.0)
                }
                
                Button("Create an Account", action: {
                    self.createAccount = true
                })
            }
        }
        .padding()
        .background(Image("Background-3"))
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}

struct UserImage: View {
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

struct PasswordSecureField: View {
    @Binding var password: String
    
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
    }
}

struct EmailTextField: View {
    @Binding var email: String
    
    var body: some View {
        TextField("Email", text: $email)
            .padding()
            .background(lightGreyColor)
            .cornerRadius(5.0)
            .padding(.bottom, 20)
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
    }
}
