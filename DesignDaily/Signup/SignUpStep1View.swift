//
//  SignUpStep1View.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 10.10.2024.
//

import SwiftUI

struct SignUpStep1View<ViewModel: SignUpViewModelProtocol>: View {
    @StateObject private var viewModel: ViewModel
    @EnvironmentObject var coordinator: AppCoordinator

    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

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
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("e-mail", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .padding(.horizontal, 40)

                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                }

                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }

                Spacer()

                Button(action: {
                    // Proceed to next step
                    coordinator.navigate(to: .signUpStep2)
                }) {
                    Text("next")
                        .frame(width: 114, height: 43)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(21.5)
                }
                .disabled(viewModel.isLoading)
                .padding(.top, 20)

                Spacer()

                Button(action: {
                    coordinator.navigate(to: .login)
                }) {
                    Text("Do you have an account? Login!")
                        .foregroundColor(.white)
                }
            }
            .padding()
        }
    }
}
