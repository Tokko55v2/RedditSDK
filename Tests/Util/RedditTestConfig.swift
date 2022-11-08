//
//  Login.swift
//  RedditSDK
//
//  Created by Michael on 07.11.22.
//

import Foundation
import RedditSDK

class RedditTestConfig {
    static let shared: RedditTestConfig = .init()
    let module: RedditModule
    
    init() {
        guard let clientId = ProcessInfo.processInfo.environment["CLIENT_ID"] else {
            fatalError("no client id found")
        }
        
        print("\(clientId)")
        
        module = RedditModuleBuilder(
            configuration: RedditConfiguration(
                clientId: "clientId",
                scopes: { ["identity", "flair"] }
            )
        ).build()
    }
}

