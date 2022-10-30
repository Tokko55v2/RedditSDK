import Combine
import Foundation

internal extension Publisher where Output == URLSession.DataTaskPublisher.Output {
    func data() -> Publishers.TryMap<Self, Data> {
        tryMap { data, response in
            if let httpResponse = response as? HTTPURLResponse {
                try httpResponse.evaluadeResponse()
            }
            return data
        }
    }
}

internal extension Publisher where Output == URLSession.DataTaskPublisher.Output {
    func decodeAPIResult<T: Decodable>(_: T.Type) -> AnyPublisher<T, ApiError> {
        data()
            .mapError { error in
                if let error = error as? ApiError {
                    return error
                } else {
                    return ApiError.genericHttpError(error.localizedDescription)
                }
            }
            .eraseToAnyPublisher()
            .flatMap { data -> AnyPublisher<T, ApiError> in
                guard let newType = try? JSONDecoder().decode(T.self, from: data) else {
                    return Fail(error: ApiError.generic("decoding error")).eraseToAnyPublisher()
                }
                return Just(newType).setFailureType(to: ApiError.self).eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
