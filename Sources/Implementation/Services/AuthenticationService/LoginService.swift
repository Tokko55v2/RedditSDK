import AppAuth
import Combine
import Foundation

internal struct LoginService {
    private let configuration: RedditConfiguration
    private let serviceConfiguration: OIDServiceConfiguration
    private let request: OIDAuthorizationRequest

    init(configuration: RedditConfiguration) {
        self.configuration = configuration

        serviceConfiguration = OIDServiceConfiguration(
            authorizationEndpoint: Constants.authorizationEndpoint,
            tokenEndpoint: Constants.tokenEndpoint
        )

        request = OIDAuthorizationRequest(
            configuration: serviceConfiguration,
            clientId: configuration.clientId,
            // needs to be empty!
            clientSecret: "",
            scopes: configuration.scopes(),
            redirectURL: configuration.redirectUri.toUrl,
            responseType: configuration.responseType,
            additionalParameters: configuration.additionalParameters
        )
    }

    public func login() -> AnyPublisher<URL, ApiError> {
        return Just(request.externalUserAgentRequestURL())
            .setFailureType(to: ApiError.self)
            .eraseToAnyPublisher()
    }

    public func handleLoginResponse(responseURL: URL) -> AnyPublisher<Void, ApiError> {
        let publisher: AnyPublisher<URL, ApiError> = Just(responseURL)
            .setFailureType(to: ApiError.self)
            .eraseToAnyPublisher()

        return publisher
            .flatMap { responseURL in
                Deferred {
                    Future<Void, ApiError> { promise in
                        let currentAuthorizationFlow = OIDAuthState.authState(
                            byPresenting: self.request,
                            externalUserAgent: OIDExternalUserSubmission()
                        ) { authState, error in
                            if let authState = authState {
                                AuthStateStore.setAuthState(authState)
                                promise(.success(()))
                            } else if let error = error {
                                AuthStateStore.clear()
                                promise(.failure(error.mapOIDErrorToRedditError))
                            } else {
                                AuthStateStore.clear()
                                promise(.failure(ApiError.generic("")))
                            }
                        }
                        currentAuthorizationFlow.resumeExternalUserAgentFlow(with: responseURL)
                    }
                }
            }
            .eraseToAnyPublisher()
    }

    class OIDExternalUserSubmission: NSObject, OIDExternalUserAgent {
        func present(_: OIDExternalUserAgentRequest, session _: OIDExternalUserAgentSession) -> Bool {
            true
        }

        func dismiss(animated _: Bool, completion: @escaping () -> Void) {
            completion()
        }
    }
}
