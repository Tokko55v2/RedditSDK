//
//  Extension+XCTestCase.swift
//  RedditSDKTests
//
//  Created by Michael on 08.11.22.
//

import XCTest
import Combine

extension XCTestCase {
    func awaitPublisher<T: Publisher>(_ publisher: T) throws -> T.Output {
        var result: Result<T.Output, Error>?
        let expectation = expectation(description: "expectation")
        
        let cancellable = publisher.sink(
            receiveCompletion: { completion in
                switch completion {
                case let .failure(error):
                    result = .failure(error)
                case .finished:
                    break
                }

                expectation.fulfill()
            },
            receiveValue: { value in
                result = .success(value)
            }
        )
        
        waitForExpectations(timeout: 10)
        cancellable.cancel()
        
        let unwrappedResult = try XCTUnwrap(result)
        
        return try unwrappedResult.get()
    }
}
