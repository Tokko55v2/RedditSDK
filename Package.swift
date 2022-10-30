// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RedditSDK",
    platforms: [
        .iOS("16"), .macOS("12")
    ],
    products: [
        .library(name: "RedditSDK", targets: ["RedditSDK"])
    ],
    dependencies: [
        .package(url: "https://github.com/openid/AppAuth-iOS.git", from: "1.6.0")
    ],
    targets: [
        .target(
            name: "RedditSDK",
            dependencies: [.product(name: "AppAuth", package: "AppAuth-iOS")],
            path: "Sources",
            exclude: ["Info.plist"]
        ),
        .testTarget(
            name: "RedditSDKTests",
            dependencies: ["RedditSDK", .product(name: "AppAuth", package: "AppAuth-iOS")],
            path: "Tests"
        )
    ]
)
