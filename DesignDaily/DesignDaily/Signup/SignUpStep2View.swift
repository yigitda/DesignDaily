//
//  SignUpStep2View.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

struct SignUpStep2View: View {
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea() // Ensures the background color fills the entire screen
            
            VStack(spacing: 20) {
                Spacer()
                
                Text("DesignDaily")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Group {
                    TextField("gender", text: $viewModel.gender)
                    TextField("birthday", text: $viewModel.birthday)
                    TextField("location", text: $viewModel.location)
                }
                .padding()
                .frame(width: 233, height: 43)
                .background(Color.white)
                .cornerRadius(20)
                
                Spacer()
                
                Button(action: {
                }) {
                    Text("next")
                        .frame(width: 114, height: 43)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(20)
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
