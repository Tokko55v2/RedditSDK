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
    
    func testIdentityMe() throws {
        let identity = try awaitPublisher(module.identityMe())
        let feature = identity.features
        XCTAssertNotNil(feature)
        
        guard let feature = feature else {
            XCTFail("Failure, unexpacted feature state")
            return
        }
        
        XCTAssertTrue(feature.chatSubreddit ?? false)
        XCTAssertTrue(feature.cookieConsentBanner ?? false)
    }
    
    func testIdentityMePreference() throws {
        let preference = try awaitPublisher(module.identityMePreference())
        XCTAssertTrue(preference.clickgadget ?? false)
        XCTAssertTrue(preference.activityRelevantAds ?? false)
    }
    
    func testUsernameAvailable() throws {
        let usernameAvailable = try awaitPublisher(module.usernameAvailable(username: "TrueLies420122"))
        XCTAssertTrue(usernameAvailable)
    }
    
    func testUsernameExist() throws {
        let usernameAvailable = try awaitPublisher(module.usernameAvailable(username: "TrueLies42"))
        XCTAssertFalse(usernameAvailable)
    }
    
    func testLinkFlair() throws {
        let linkFlair = try awaitPublisher(module.linkFlair(subreddit: "dance"))
        XCTAssertTrue(!linkFlair.isEmpty)
    }
    
    func testFailLinkFlairForbidden() throws {
        let store = module.linkFlair(subreddit: "books")
            .sink(receiveCompletion: { completion in
                switch completion {
                case let .failure(error):
                    XCTAssertEqual(ApiError.forbidden, error)
                case .finished:
                    break
                }
            }, receiveValue: { _ in })
        store.cancel()
    }
}
