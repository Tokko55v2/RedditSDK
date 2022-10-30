import Combine
import Foundation

internal enum AuthStateService {
    static func getAccessToken() -> AnyPublisher<String, ApiError> {
        guard let authState = AuthStateStore.getAuthState() else {
            return Fail(error: ApiError.generic("Could not get an accessToken from UserDefaults")).eraseToAnyPublisher()
        }

        return Deferred {
            Future<String, ApiError> { promise in
                authState.performAction { accessToken, _, error in
                    if let error = error {
                        promise(.failure(error.mapOIDErrorToRedditError))
                    }

                    let access = accessToken
                    if let accessToken = accessToken {
                        promise(.success(accessToken))
                    }

                    promise(.failure(.accessTokenError))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
