//
//  LoginView.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

struct LoginView<ViewModel: LoginViewModelProtocol>: View {
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
                    Task {
                        await viewModel.login()
                    }
                }) {
                    Text("login")
                        .frame(width: 114, height: 43)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(20)
                }
                .disabled(viewModel.isLoading)
                .padding(.top, 20)

                Spacer()

                Button(action: {
                    coordinator.navigate(to: .signUpStep1)
                }) {
                    Text("Don't have an account? Sign up!")
                        .foregroundColor(.white)
                }
            }
            .padding()
        }
    }
}
