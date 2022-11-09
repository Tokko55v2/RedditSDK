//
//  RedditSDKLoginTests.swift
//  RedditSDKTests
//
//  Created by Michael on 07.11.22.
//

import WebKit
import XCTest
@testable import RedditSDK

final class redditSDKLoginTests: XCTestCase {
    var module: RedditModule!

    override func setUpWithError() throws {
        module = RedditTestConfig().module
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLogin() throws {
        let identity = try awaitPublisher(module.identityMe())
        XCTAssertTrue(identity.features?.chatSubreddit ?? false)
    }
}
