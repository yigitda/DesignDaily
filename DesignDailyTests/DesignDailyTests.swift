import Testing
import SwiftUI
@testable import DesignDaily

@MainActor
struct LoginViewModelTests {
    @Test func loginSuccess() async throws {
        let service = MockUserService()
        let coordinator = AppCoordinator(userService: service, productService: MockProductService())
        let viewModel = LoginViewModel(userService: service, coordinator: coordinator)
        viewModel.email = "test@example.com"
        viewModel.password = "password"
        await viewModel.login()
        #expect(coordinator.isAuthenticated == true)
        #expect(viewModel.errorMessage == nil)
        #expect(viewModel.isLoading == false)
    }

    @Test func loginFailure() async throws {
        let service = MockUserService(shouldFail: true)
        let coordinator = AppCoordinator(userService: service, productService: MockProductService())
        let viewModel = LoginViewModel(userService: service, coordinator: coordinator)
        viewModel.email = "wrong@example.com"
        viewModel.password = "wrong"
        await viewModel.login()
        #expect(coordinator.isAuthenticated == false)
        #expect(viewModel.errorMessage == "Invalid credentials")
        #expect(viewModel.isLoading == false)
    }
}

@MainActor
struct SignUpViewModelTests {
    @Test func signUpValidationFails() async throws {
        let service = RecordingUserService()
        let coordinator = AppCoordinator(userService: service, productService: MockProductService())
        let viewModel = SignUpViewModel(userService: service, coordinator: coordinator)
        viewModel.fullName = ""
        viewModel.email = "test@example.com"
        viewModel.password = "password"
        await viewModel.signUp()
        #expect(service.signUpCallCount == 0)
        #expect(coordinator.isAuthenticated == false)
        #expect(viewModel.errorMessage == "Please fill all fields.")
        #expect(viewModel.isLoading == false)
    }

    @Test func signUpSuccess() async throws {
        let service = MockUserService()
        let coordinator = AppCoordinator(userService: service, productService: MockProductService())
        let viewModel = SignUpViewModel(userService: service, coordinator: coordinator)
        viewModel.fullName = "Test User"
        viewModel.email = "test@example.com"
        viewModel.password = "password"
        await viewModel.signUp()
        #expect(coordinator.isAuthenticated == true)
        #expect(viewModel.errorMessage == nil)
        #expect(viewModel.isLoading == false)
    }

    @Test func signUpFailure() async throws {
        let service = MockUserService(shouldFail: true)
        let coordinator = AppCoordinator(userService: service, productService: MockProductService())
        let viewModel = SignUpViewModel(userService: service, coordinator: coordinator)
        viewModel.fullName = "Test User"
        viewModel.email = "test@example.com"
        viewModel.password = "password"
        await viewModel.signUp()
        #expect(coordinator.isAuthenticated == false)
        #expect(viewModel.errorMessage == "Sign up failed")
        #expect(viewModel.isLoading == false)
    }
}
