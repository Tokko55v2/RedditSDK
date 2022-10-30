import Combine
import Foundation

internal enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
}

internal struct RequestServices {
    func request<T: Decodable>(
        queryItems: [URLQueryItem],
        method: HttpMethod,
        endpoint: Endpoint,
        type: T.Type
    ) -> AnyPublisher<T, ApiError> {
        AuthStateService.getAccessToken()
            .flatMap { accessToken in
                self.request(queryItems: queryItems, method: method, endpoint: endpoint, accessToken, type: type.self)
            }
            .eraseToAnyPublisher()
    }

    func request<T: Decodable>(method: HttpMethod, endpoint: Endpoint, type: T.Type) -> AnyPublisher<T, ApiError> {
        AuthStateService.getAccessToken()
            .flatMap { accessToken in
                self.request(method: method, endpoint: endpoint, accessToken, type: type.self)
            }
            .eraseToAnyPublisher()
    }

    private func request<T: Decodable>(
        queryItems: [URLQueryItem] = [],
        method: HttpMethod,
        endpoint: Endpoint,
        _ accessToken: String,
        type: T.Type
    ) -> AnyPublisher<T, ApiError> {
        guard var urlComponents = URLComponents(string: endpoint.url.absoluteString) else {
            return Fail(error: ApiError.generic("")).eraseToAnyPublisher()
        }

        urlComponents.queryItems = queryItems

        guard let url = urlComponents.url else {
            return Fail(error: ApiError.generic("")).eraseToAnyPublisher()
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = [
            "Authorization": "bearer \(accessToken)"
        ]

        return URLSession.DataTaskPublisher(request: request, session: .shared)
            .decodeAPIResult(type)
    }

    // MARK: for request the come within an arry

    struct OptionalObject<Base: Decodable>: Decodable {
        public let value: Base?

        public init(from decoder: Decoder) throws {
            do {
                let container = try decoder.singleValueContainer()
                value = try container.decode(Base.self)
            } catch {
                value = nil
            }
        }
    }

    // TODO: Just for now find a better way.
    func requestForArray(method: HttpMethod = .get, endpoint: Endpoint) -> AnyPublisher<[LinkFlair2], ApiError> {
        AuthStateService.getAccessToken()
            .flatMap { accessToken -> AnyPublisher<[LinkFlair2], ApiError> in
                var request = URLRequest(url: endpoint.url)
                request.httpMethod = method.rawValue
                request.allHTTPHeaderFields = [
                    "Authorization": "bearer \(accessToken)"
                ]

                return URLSession.DataTaskPublisher(request: request, session: .shared)
                    .tryMap { data, response in
                        if let httpResonse = response as? HTTPURLResponse {
                            try httpResonse.evaluadeResponse()
                        }

                        let model = try? JSONDecoder().decode([OptionalObject<LinkFlair2>].self, from: data)

                        let editModel = model?.compactMap {
                            LinkFlair2(
                                allowableContent: $0.value?.allowableContent,
                                backgroundColor: $0.value?.backgroundColor,
                                cssClass: $0.value?.cssClass, id: $0.value?.id,
                                maxEmojis: $0.value?.maxEmojis,
                                modOnly: $0.value?.modOnly,
                                richtext: $0.value?.richtext,
                                text: $0.value?.text,
                                textColor: $0.value?.textColor,
                                textEditable: $0.value?.textEditable,
                                type: $0.value?.type
                            )
                        }

                        if let editModel = editModel {
                            return editModel
                        } else {
                            throw ApiError.generic("decoding flair failed")
                        }
                    }
                    .mapError { error in
                        if let error = error as? ApiError {
                            return error
                        } else {
                            return ApiError.genericHttpError(error.localizedDescription)
                        }
                    }
                    .flatMap { data -> AnyPublisher<[LinkFlair2], ApiError> in
                        Just(data).setFailureType(to: ApiError.self).eraseToAnyPublisher()
                    }
                    .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
