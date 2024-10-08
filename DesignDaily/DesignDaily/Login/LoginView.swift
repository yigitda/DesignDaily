//
//  LoginView.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Spacer()
                    
                    Text("DesignDaily")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                    
                    Group {
                        TextField("e-mail", text: $email)
                        SecureField("password", text: $password)
                    }
                    .padding()
                    .frame(width: 233, height: 43)
                    .background(Color.white)
                    .cornerRadius(20)
                    
                    Spacer()
                    
                    Button(action: {
                    }) {
                        Text("login")
                            .frame(width: 114, height: 43)
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(20)
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                    
                    NavigationLink(destination: SignUpStep1View(viewModel: SignUpViewModel())) {
                        Text("Don't have an account? Sign up!")
                            .foregroundColor(.white)
                    }
                }
                .padding()
            }
        }
    }
}

