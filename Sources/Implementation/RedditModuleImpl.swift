import Combine
import Foundation

internal final class RedditModuleImpl: RedditModule {
    private let configuration: RedditConfiguration
    private let loginService: LoginService
    private let requestServices: RequestServices

    public init(configuration: RedditConfiguration) {
        self.configuration = configuration
        loginService = LoginService(configuration: configuration)
        requestServices = RequestServices()
    }

    func login() -> AnyPublisher<URL, ApiError> {
        loginService.login()
    }

    func handleLoginResponse(url: URL) -> AnyPublisher<Void, ApiError> {
        loginService.handleLoginResponse(responseURL: url)
    }

    func identityMe() -> AnyPublisher<IdentityMe, ApiError> {
        requestServices.request(method: .get, endpoint: .identityMe, type: IdentityMe.self)
    }

    func identityMePreference() -> AnyPublisher<MePrefrence, ApiError> {
        requestServices.request(method: .get, endpoint: .identityMePrefs, type: MePrefrence.self)
    }

    func identityMeTrophies() -> AnyPublisher<Void, ApiError> {
        Fail(error: ApiError.notImplemented).eraseToAnyPublisher()
    }

    func accountBlockUser() -> AnyPublisher<IdentityMe, ApiError> {
        requestServices.request(method: .get, endpoint: .accountBlockUser, type: IdentityMe.self)
    }

    func usernameAvailable(username: String) -> AnyPublisher<Bool, ApiError> {
        requestServices.request(
            queryItems: [
                URLQueryItem(name: Constants.unsernameQueryKey, value: username)
            ],
            method: .get,
            endpoint: .usernameAvailable,
            type: Bool.self
        )
    }

    func linkFlair(subreddit: String) -> AnyPublisher<[LinkFlair2], ApiError> {
        requestServices.requestForArray(endpoint: .linkFlair(subreddit))
    }
}
