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
            NavigationStack {
                Text("Settings")
                    .font(.title)
                    .fontWeight(.semibold)
                NavigationLink("Account") {
                    ExistingUserView()
                }
                // View Mood Report
                NavigationLink("Mood Report") {
                    MoodView()
                }
                
                FormView()
                
                // Save button
                Button(action: {
                    
                }) {
                    Text("Save")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 200, height: 60)
                        .background(Color.green)
                        .cornerRadius(15.0)
                }
            }
        }
        .padding()
        .background(Image("Background-6"))
    }
}

struct MoodView: View {
    var body: some View {
        Image("Mood Report")
            .resizable().scaledToFit()
    }
}

struct InterestsView: View {
    // Interests toggles
    @State var includeAnimals: Bool = false
    @State var includeMarvel: Bool = false
    @State var includeSports: Bool = false
    @State var includeEducation: Bool = false
    @State var includeSunsets: Bool = false
    @State var includeDisney: Bool = false
    @State var includeStarWars: Bool = false
    @State var includeNature: Bool = false
    
    var body: some View {
        VStack {
            Text("Interests")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.headline)
            
            Toggle(isOn: $includeAnimals) {
                Text("Animals")
            }
            
            Toggle(isOn: $includeMarvel) {
                Text("Marvel")
            }

            Toggle(isOn: $includeSports) {
                Text("Sports")
            }

            Toggle(isOn: $includeEducation) {
                Text("Education")
            }

            Toggle(isOn: $includeDisney) {
                Text("Disney")
            }

            Toggle(isOn: $includeStarWars) {
                Text("Star Wars")
            }

            Toggle(isOn: $includeNature) {
                Text("Nature")
            }
        }
    }
}

struct ExistingUserView: View {
    @State private var loggedOut = false
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
        
        VStack {
            if loggedOut {
                Login()
            } else {
                UserImage()
                
                Form {
                    // TODO:
                    // Add empty field checks to all fields
                    
                    ZStack {
                        Text("Cerys").frame(maxWidth: .infinity, alignment: .trailing)
                        HStack {
                            Text("First Name")
                            TextField("", text: $fName)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled()
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    
                    ZStack {
                        Text("Watts").frame(maxWidth: .infinity, alignment: .trailing)
                        HStack {
                            Text("Surname")
                            TextField("", text: $surname)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled()
                                .multilineTextAlignment(.trailing)
                        }
                    }
                    
                    ZStack {
                        Text("cwatts06@qub.ac.uk").frame(maxWidth: .infinity, alignment: .trailing)
                        HStack {
                            Text("Email")
                            TextField("", text: $email)
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled()
                                .multilineTextAlignment(.trailing)
                                .onSubmit {
                                    validEmail = isValidEmail(email: email)
                                }
                        }
                    }
                    if !validEmail {
                        Text("Invalid email address")
                            .offset(y: -10)
                            .foregroundColor(.red)
                    }
                    //                let stringDate = "2000-02-08"
                    //                let dateFormatter = DateFormatter()
                    //                dateFormatter.dateFormat = "yyyy-MM-dd"
                    //                let date = dateFormatter.date(from: stringDate)
                    //(date ?? Date.now)
                    
                    DatePicker(selection: $dob, in: ...Date.now, displayedComponents: .date) {
                        Text("Date of Birth")
                    }
                    
                    HStack {
                        Text("Change Password")
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
                
                Button("Delete Account", action: {
                    self.loggedOut = true
                }).font(.title).foregroundColor(.red)
            }
        }
        .padding()
        .background(Image("Background-3"))
        .ignoresSafeArea()
    }
}

struct FormView: View {
    @State var includeCameraRoll: Bool = false
    @State var notificationNum = 1.0
    @State var isEditing = false
    @State var time = Date.now
    @State var randomTime: Bool = false
    
    var body: some View {
        Form {
            // No. of Notifications
            VStack {
                Text("No. of Notifications")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                
                Slider(value: $notificationNum, in: 1...5, step: 1)
                {
                    Text("No. of Notifications")
                }
            minimumValueLabel: {
                Text("1")
            }
            maximumValueLabel: {
                Text("5")
            }
            onEditingChanged: { editing in
                isEditing = editing
            }
                
                Text("\(Int(notificationNum))")
            }
            
            // Selecting notification times
            VStack {
                Text("Notification Times")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                
                Toggle(isOn: $randomTime) {
                    Text("Random Times")
                }
                
                if randomTime == false {
                    DatePicker("Please enter a time:", selection: $time, displayedComponents: .hourAndMinute)
                }
            }
            
            // Include Camera Roll
            Toggle(isOn: $includeCameraRoll) {
                Text("Camera Roll")
            }
            
            // Select Interests
            InterestsView()
            
        }
        .scrollContentBackground(.hidden)
    }
}
