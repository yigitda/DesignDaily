//
//  SignUpStep2View.swift
//  DesignDaily
//
//  Created by Yigit Dayı on 8.10.2024.
//

import SwiftUI

struct SignUpStep2View<ViewModel: SignUpViewModelProtocol>: View {
    @StateObject private var viewModel: ViewModel
    @EnvironmentObject var coordinator: AppCoordinator

    init(viewModel: ViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    @State private var gender: String = ""
    @State private var birthday: String = ""
    @State private var location: String = ""

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
                    TextField("gender", text: $gender)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("birthday", text: $birthday)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("location", text: $location)
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
                        await viewModel.signUp()
                    }
                }) {
                    Text("Sign Up")
                        .frame(width: 114, height: 43)
                        .background(Color.white)
                        .foregroundColor(.black)
                        .cornerRadius(20)
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
