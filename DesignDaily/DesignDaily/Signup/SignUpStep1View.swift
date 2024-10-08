//
//  SignUpStep1View.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 10.10.2024.
//

import SwiftUI

struct SignUpStep1View: View {
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                
                Text("DesignDaily")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Group {
                    TextField("full name", text: $viewModel.fullName)
                    TextField("phone number", text: $viewModel.phoneNumber)
                    TextField("e-mail", text: $viewModel.email)
                    SecureField("password", text: $viewModel.password)
                }
                .padding()
                .frame(width: 233, height: 43)
                .background(Color.white)
                .cornerRadius(20)
                
                Spacer()
                
                NavigationLink(destination: SignUpStep2View(viewModel: viewModel)) {
                    Text("next")
                        .frame(width: 114, height: 43)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(21.5)
                }
                .padding(.top, 20)
                
                Spacer()
                
                NavigationLink(destination: LoginView()) {
                    Text("Do you have an account? Login!")
                        .foregroundColor(.white)
                }
            }
            .padding()
        }
    }
}
