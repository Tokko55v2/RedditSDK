import Combine
import Foundation

internal final class RedditModuleImpl: RedditModule {
    private let configuration: ReddiConfiguration
    private let loginService: LoginService
    private let requestServices: RequestServices

    public init(configuration: ReddiConfiguration) {
        self.configuration = configuration
        loginService = LoginService(configuration: configuration)
        requestServices = RequestServices()
    }

    func login() -> AnyPublisher<URL, ApiError> {
        loginService.login()
    }

    func handleLoginRespone(url: URL) -> AnyPublisher<Void, ApiError> {
        loginService.handleLoginResponse(responseURL: url)
    }

    func identityMe() -> AnyPublisher<IdentityMe, ApiError> {
        requestServices.request(method: .get, endpoint: .identityMe, type: IdentityMe.self)
    }

    func identityMePrefs() -> AnyPublisher<MePrefrence, ApiError> {
        requestServices.request(method: .get, endpoint: .identityMePrefs, type: MePrefrence.self)
    }

    func identityMeTrophies() -> AnyPublisher<IdentityMe, ApiError> {
        requestServices.request(method: .get, endpoint: .identityMeTrophies, type: IdentityMe.self)
    }

    func accountBlockeUser() -> AnyPublisher<IdentityMe, ApiError> {
        requestServices.request(method: .get, endpoint: .accountBlockeUser, type: IdentityMe.self)
    }

    func usernameAvailable(username: String) -> AnyPublisher<Bool, ApiError> {
        requestServices.request(
            queryItems: [URLQueryItem(name: "user", value: username)],
            method: .get,
            endpoint: .usernameAvailable,
            type: Bool.self
        )
    }

    func linkFlair(subreddit: String) -> AnyPublisher<[LinkFlair2], ApiError> {
        requestServices.requestForArray(endpoint: .linkFlair(subreddit))
    }
}
