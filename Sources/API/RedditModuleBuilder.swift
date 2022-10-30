import Foundation

public struct RedditModuleBuilder {
    private let redditConfiguration: ReddiConfiguration

    public init(configuration: ReddiConfiguration) {
        redditConfiguration = configuration
    }

    public func build() -> RedditModule {
        RedditModuleImpl(
            configuration: redditConfiguration
        )
    }
}
