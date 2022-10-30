import AppAuth
import Foundation

internal extension Error {
    var mapOIDErrorToRedditError: ApiError {
        if let error = self as? OIDErrorCode {
            switch error {
            case .networkError:
                return .generic("networkError")
            case .programCanceledAuthorizationFlow:
                return .generic("programCanceledAuthorizationFlow")
            case .serverError:
                return .generic("serverError")
            case .tokenRefreshError:
                return .generic("tokenRefreshError")
            case .userCanceledAuthorizationFlow:
                return .generic("userCanceledAuthorizationFlow")
            case .tokenResponseConstructionError:
                return .generic("tokenResponseConstructionError")
            default:
                return .generic("\(localizedDescription)")
            }
        } else {
            return .generic("\(localizedDescription)")
        }
    }
}
