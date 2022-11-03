import Foundation

internal extension HTTPURLResponse {
    // swiftlint:disable cyclomatic_complexity
    func evaluateResponse() throws {
        if statusCode == 400 {
            throw ApiError.badRequest
        }

        if statusCode == 401 {
            throw ApiError.unauthorized
        }

        if statusCode == 403 {
            throw ApiError.forbidden
        }

        if statusCode == 404 {
            throw ApiError.notFound
        }

        if statusCode == 408 {
            throw ApiError.requestTimeout
        }

        if 408 ..< 500 ~= statusCode {
            throw ApiError.genericHttpError("\(statusCode)")
        }

        if statusCode == 500 {
            throw ApiError.internalServerError
        }

        if statusCode == 501 {
            throw ApiError.notImplemented
        }

        if statusCode == 502 {
            throw ApiError.badGateway
        }

        if statusCode == 503 {
            throw ApiError.serviceUnavailable
        }

        if statusCode > 503 {
            throw ApiError.genericHttpError("\(statusCode)")
        }
    }
}
