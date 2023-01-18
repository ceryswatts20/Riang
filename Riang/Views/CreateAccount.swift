//
//  Login.swift
//  Riang
//
//  Created by Cerys Watts on 13/01/2023.
//

import SwiftUI

struct CreateAccount: View {
    @State private var validationFailed: Bool = false
    @State private var settings: Bool = false
    
    var body: some View {
        VStack {
            if settings {
                // Open Main in settings tab
                Main(selectedTab: "settings")
            } else {
                Text("Create an Account")
                    .font(.title)
                    .fontWeight(.semibold)
                UserInfoView()
                
                // Validation messages
                if validationFailed {
                    Text("Please fill in all fields.")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                
                Button(action: {
                    // validation tests
                    //if validationFailed {
                        // If email is fine, all fields filled in and passwords match
                        settings = true
                    //}
                }) {
                    Text("Submit")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color.green)
                        .cornerRadius(15.0)
                }
            }
        }.background(Image("Background-4"))
    }
}


struct CreateAccount_Preview: PreviewProvider {
    static var previews: some View {
        CreateAccount()
    }
}
struct UserInfoView: View {
    @State private var fName = ""
    @State private var surname = ""
    @State private var email = ""
    @State private var dob = Date.now
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var passwordMatchFail: Bool = false
    @State private var validPassword: Bool = true
    @State private var validEmail: Bool = true
    
    var body: some View {
        Form {
            // TODO:
            // Add empty field checks to all fields
            
            HStack {
                Text("First Name")
                TextField("Required", text: $fName)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .multilineTextAlignment(.trailing)
            }
            
            HStack {
                Text("Surname")
                TextField("Required", text: $surname)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .multilineTextAlignment(.trailing)
            }
            
            HStack {
                Text("Email")
                TextField("Required", text: $email)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .multilineTextAlignment(.trailing)
                    .onSubmit {
                        validEmail = isValidEmail(email: email)
                    }
            }
            if !validEmail {
                Text("Invalid email address")
                    .offset(y: -10)
                    .foregroundColor(.red)
            }
            
            DatePicker(selection: $dob, in: ...Date.now, displayedComponents: .date) {
                Text("Date of Birth")
            }
            
            HStack {
                Text("Password")
                // Hides input text
                SecureField("Required", text: $password)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .multilineTextAlignment(.trailing)
                    .onSubmit {
                        validPassword = isPasswordValid(password: password)
                    }
            }
            if !validPassword {
                Text("Invalid Password. Password must contain a capital letter, a number, a special charater and be at least 6 chars long")
                    .offset(y: -10)
                    .foregroundColor(.red)
            }
            
            HStack {
                Text("Confirm Password")
                SecureField("Required", text: $confirmPassword)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled()
                    .multilineTextAlignment(.trailing)
                    .onSubmit {
                        if confirmPassword != password {
                            passwordMatchFail = true
                        }
                    }
            }
            if passwordMatchFail {
                Text("Passwords do not match")
                    .offset(y: -10)
                    .foregroundColor(.red)
            }
            
        }
        .cornerRadius(15.0)
        .scrollContentBackground(.hidden)
    }
}

func isValidEmail(email: String) -> Bool {
    let emailValidationRegex = "^[\\p{L}0-9!#$%&'*+\\/=?^_`{|}~-][\\p{L}0-9.!#$%&'*+\\/=?^_`{|}~-]{0,63}@[\\p{L}0-9-]+(?:\\.[\\p{L}0-9-]{2,7})*$"
    let emailValidationPredicate = NSPredicate(format: "SELF MATCHES %@", emailValidationRegex)
    return emailValidationPredicate.evaluate(with: email)
}

func isPasswordValid(password: String) -> Bool {
    // 6 chars long
    // Capital letter
    // Number
    // Special char
    let passwordPredicate = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-z])(?=.*[0-9])(?=.*[$@$#!%*?&])(?=.*[A-Z]).{6,}$")
    return passwordPredicate.evaluate(with: password)
}
