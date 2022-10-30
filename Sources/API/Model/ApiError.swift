import Foundation

public enum ApiError: Error, LocalizedError {
    case generic(String?)
    case accessTokenError

    // HTTPError
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case requestTimeout

    case internalServerError
    case notImplemented
    case badGateway
    case serviceUnvailable

    case genericHttpError(String?)

    public var errorDescription: String? {
        switch self {
        case let .genericHttpError(reason):
            return reason
        case let .generic(reason):
            return reason
        case .accessTokenError:
            return "While getting an accesstoken an error occured"
        case .badRequest:
            return "The server cannot or will not process the request due to an apparent client error"
        case .unauthorized:
            return "User is not authorized"
        case .forbidden:
            return "User is forbidden to do this action, could also be the wrong scope"
        case .notFound:
            return "Action is not allwoed or not found"
        case .requestTimeout:
            return "Request Timeout"
        case .internalServerError:
            return "Internal Server Error"
        case .notImplemented:
            return "Not implemented"
        case .badGateway:
            return "Bad Gateway"
        case .serviceUnvailable:
            return "Service is not reachable right now"
        }
    }
}
