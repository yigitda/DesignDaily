import Foundation
@testable import DesignDaily

final class RecordingUserService: UserServiceProtocol {
    var loginCallCount = 0
    var signUpCallCount = 0
    var loginResult: Result<User, Error>
    var signUpResult: Result<User, Error>

    init(loginResult: Result<User, Error> = .success(User(id: UUID(), fullName: "Test", email: "test@example.com", biography: "", contactInfo: "", profileImageName: "")),
         signUpResult: Result<User, Error> = .success(User(id: UUID(), fullName: "Test", email: "test@example.com", biography: "", contactInfo: "", profileImageName: ""))) {
        self.loginResult = loginResult
        self.signUpResult = signUpResult
    }

    func login(email: String, password: String) async throws -> User {
        loginCallCount += 1
        return try loginResult.get()
    }

    func signUp(user: User, password: String) async throws -> User {
        signUpCallCount += 1
        return try signUpResult.get()
    }
}
