import Foundation

/// Builder creating an instance of the RedditSDK.
/// This instance should be kept, as long as the App lives.
public struct RedditModuleBuilder {
    /// Holds the needed configuration for the authentication against Reddit
    private let redditConfiguration: RedditConfiguration

    /// - Parameter configuration: ``RedditConfiguration``
    public init(configuration: RedditConfiguration) {
        redditConfiguration = configuration
    }

    /// Creates an instance for accessing the implementations for the RedditModule
    /// - Returns: ``RedditModule``
    public func build() -> RedditModule {
        RedditModuleImpl(
            configuration: redditConfiguration
        )
    }
}
