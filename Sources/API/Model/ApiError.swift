import Foundation

public enum ApiError: Equatable, Error, LocalizedError {
    /// A generic error occurred and contains an error description.
    case generic(String?)
    /// Occurs when an access token could not be determined.
    case accessTokenError

    /// Bad request
    ///
    /// - HTTP Status Code: 400
    case badRequest
    /// Unauthorized
    ///
    /// - HTTP Status Code: 401
    case unauthorized
    /// Forbidden
    ///
    /// - HTTP Status Code: 403
    case forbidden
    /// NotFound
    ///
    /// - HTTP Status Code: 404
    case notFound
    /// Request Timeout
    ///
    /// - HTTP Status Code: 408
    case requestTimeout

    /// Internal Server Error
    ///
    /// - HTTP Status Code: 500
    case internalServerError
    /// Not Implemented
    ///
    /// - HTTP Status Code: 501
    case notImplemented
    /// Service Unavailable
    ///
    /// - HTTP Status Code: 503
    case serviceUnavailable
    /// Bad Gateway
    ///
    /// - HTTP Status Code: 504
    case badGateway

    /// A generic error occurred, contains a error description.
    case genericHttpError(String?)

    public var errorDescription: String? {
        switch self {
        case let .genericHttpError(reason):
            return reason
        case let .generic(reason):
            return reason
        case .accessTokenError:
            return "While getting an access token an error occurred"
        case .badRequest:
            return "The server cannot or will not process the request due to an apparent client error"
        case .unauthorized:
            return "User is not authorized"
        case .forbidden:
            return "User is forbidden to do this action, could also be the wrong scope"
        case .notFound:
            return "Action is not allowed or not found"
        case .requestTimeout:
            return "Request Timeout"
        case .internalServerError:
            return "Internal Server Error"
        case .notImplemented:
            return "Not implemented"
        case .badGateway:
            return "Bad Gateway"
        case .serviceUnavailable:
            return "Service is not reachable right now"
        }
    }
}
