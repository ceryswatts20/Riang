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
    @State private var isPresenting = false
    @State private var isPresenting2 = false
    @State private var isPresenting3 = false
    @State private var isPresenting4 = false
    @State private var isPresenting5 = false
    @State private var isPresenting6 = false
    @State private var isPresenting7 = false
    
    var body: some View {
        VStack {
            Text("History Page")
                .font(.title)
                .fontWeight(.semibold)
            
            ScrollView {
                VStack {
                    Image("Jamie and Natasha")
                        .resizable()
                        .scaledToFit()
                        .fullScreenCover(isPresented: $isPresenting4, onDismiss: didDismiss) {
                            ZStack {
                                Label("", systemImage: "x.circle")
                                    .position(x: 350, y: 20)
                                    .font(.largeTitle)
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        isPresenting4 = false
                                    }
                                
                                Image("Jamie and Natasha").resizable().scaledToFit()
                            }
                            .background(Image("Background-4"))
                        }
                        .onTapGesture {
                            isPresenting4.toggle()
                        }
                    
                    Image("Nur")
                        .resizable()
                        .scaledToFit()
                        .fullScreenCover(isPresented: $isPresenting5, onDismiss: didDismiss) {
                            ZStack {
                                Label("", systemImage: "x.circle")
                                    .position(x: 350, y: 20)
                                    .font(.largeTitle)
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        isPresenting5 = false
                                    }
                                
                                Image("Nur").resizable().scaledToFit()
                            }
                            .background(Image("Background-4"))
                        }
                        .onTapGesture {
                            isPresenting5.toggle()
                        }
                    
                    Image("Anisah")
                        .resizable()
                        .scaledToFit()
                        .fullScreenCover(isPresented: $isPresenting6, onDismiss: didDismiss) {
                            ZStack {
                                Label("", systemImage: "x.circle")
                                    .position(x: 350, y: 20)
                                    .font(.largeTitle)
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        isPresenting6 = false
                                    }
                                
                                Image("Anisah").resizable().scaledToFit()
                            }
                            .background(Image("Background-4"))
                        }
                        .onTapGesture {
                            isPresenting6.toggle()
                        }
                    
                    Image("Temp Image")
                        .resizable()
                        .scaledToFit()
                        .fullScreenCover(isPresented: $isPresenting, onDismiss: didDismiss) {
                            ZStack {
                                Label("", systemImage: "x.circle")
                                    .position(x: 350, y: 20)
                                    .font(.largeTitle)
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        isPresenting = false
                                    }
                                
                                Image("Temp Image").resizable().scaledToFit()
                            }
                            .background(Image("Background-4"))
                        }
                        .onTapGesture {
                            isPresenting.toggle()
                        }
                    
                    Image("Niffler")
                        .resizable()
                        .scaledToFit()
                        .fullScreenCover(isPresented: $isPresenting7, onDismiss: didDismiss) {
                            ZStack {
                                Label("", systemImage: "x.circle")
                                    .position(x: 350, y: 20)
                                    .font(.largeTitle)
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        isPresenting7 = false
                                    }
                                
                                Image("Niffler").resizable().scaledToFit()
                            }
                            .background(Image("Background-4"))
                        }
                        .onTapGesture {
                            isPresenting7.toggle()
                        }
                    
                    Image("Temp Image 2")
                        .resizable()
                        .scaledToFit()
                        .fullScreenCover(isPresented: $isPresenting2, onDismiss: didDismiss) {
                            ZStack {
                                Label("", systemImage: "x.circle")
                                    .position(x: 350, y: 20)
                                    .font(.largeTitle)
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        isPresenting2 = false
                                    }
                                
                                Image("Temp Image 2").resizable().scaledToFit()
                            }
                            .background(Image("Background-4"))
                        }
                        .onTapGesture {
                            isPresenting2.toggle()
                        }
                    
                    // Add ad image
                    Image("Temp Image 3")
                        .resizable()
                        .scaledToFit()
                        .fullScreenCover(isPresented: $isPresenting3, onDismiss: didDismiss) {
                            ZStack {
                                Label("", systemImage: "x.circle")
                                    .position(x: 350, y: 20)
                                    .font(.largeTitle)
                                    .foregroundColor(.blue)
                                    .onTapGesture {
                                        isPresenting3 = false
                                    }
                                
                                Image("Temp Image 3").resizable().scaledToFit()
                            }
                            .background(Image("Background-4"))
                        }
                        .onTapGesture {
                            isPresenting3.toggle()
                        }
                    
                }
            }
        }
        .scrollContentBackground(.hidden)
        .background(Image("Background-2"))
    }
}

func didDismiss() {
    
}


struct SettingsView: View {
    
    var body: some View {
        VStack {
            Text("Settings")
                .font(.title)
                .fontWeight(.semibold)
            
            FormView()
        }
        .background(Image("Background-6"))
    }
}

struct MoodView: View {
    @State public var settings = false
    
    var body: some View {
        VStack {
            
            Image("Mood Report")
                .resizable().scaledToFit()
        }.background(Image("Background-4"))
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
    @State private var dob = Date()
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var passwordMatchFail: Bool = false
    @State private var validPassword: Bool = true
    @State private var validEmail: Bool = true
    
    @State private var settings = false
    
    var body: some View {
        
        VStack {
            if loggedOut {
                Login()
            }
            else if settings {
                FormView()
            }
            else {
                VStack {
                    UserImage()
                    
                    Form {
                        // TODO:
                        // Add empty field checks to all fields
                        
                        HStack {
                            Text("First Name:").frame(maxWidth: .infinity, alignment: .leading)
                            Spacer()
                            Text("Cerys").frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        
                        HStack {
                            Text("Surname:").frame(maxWidth: .infinity, alignment: .leading)
                            Spacer()
                            Text("Watts:").frame(maxWidth: .infinity, alignment: .trailing)
                        }
                        
                        HStack {
                            Text("Email:").frame(maxWidth: .infinity, alignment: .leading)
                            Spacer()
                            Text("cwatts06@qub.ac.uk").frame(maxWidth: .infinity, alignment: .trailing).lineLimit(1)
                        }
                        
                        DatePicker(selection: $dob, in: ...Date.now, displayedComponents: .date) {
                            Text("Date of Birth:")
                        }
                        .onAppear {
                            let calendar = Calendar(identifier: .gregorian)
                            let components = DateComponents(year: 2000, month: 2, day: 8)
                            if let customDate = calendar.date(from: components) {
                                self.dob = customDate /// set customDate to date
                            }
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
                    
//                    Button("Delete Account", action: {
//                        self.loggedOut = true
//                    }).font(.title).foregroundColor(.red)
                }
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
    @State private var moodReport: Bool = false
    @State private var account: Bool = false
    
    var body: some View {
        
        ZStack {
            if moodReport {
                MoodView()
            }
            else if account {
                ExistingUserView()
            }
            else {
                NavigationStack {
                    NavigationLink(destination: ExistingUserView()) {
                        Text("       Account").foregroundColor(.black)
                        Spacer()
                        Label("", systemImage: "chevron.right")
                            .foregroundColor(.black)
                    }
                    NavigationLink(destination: MoodView()) {
                        Text("       Mood Report").foregroundColor(.black)
                        Spacer()
                        Label("", systemImage: "chevron.right")
                            .foregroundColor(.black)
                    }
                    
                    VStack {
                        Form {
//                            HStack {
//                                Button(action: {
//                                    account = true
//                                }) {
//                                    Text("Account").foregroundColor(.black)
//                                }
//                                Spacer()
//                                Label("", systemImage: "chevron.right")
//                                    .foregroundColor(.black)
//                            }
//
//                            HStack {
//                                Button(action: {
//                                    moodReport = true
//                                }) {
//                                    Text("Mood Report").foregroundColor(.black)
//                                }
//                                Spacer()
//                                Label("", systemImage: "chevron.right")
//                                    .foregroundColor(.black)
//                            }
                            
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
            }
        }
    }
}
