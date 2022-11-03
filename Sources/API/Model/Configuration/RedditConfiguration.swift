import Foundation

/// Holds the needed configurations for the OAuth2 authentication
public struct RedditConfiguration {
    internal let clientId: String
    internal let redirectUri: String
    internal let responseType: String
    internal let additionalParameters: [String: String]
    internal let scopes: () -> [String]

    /// Create an installed app at `reddit.com/prefs/apps`.
    /// - Parameters:
    ///   - clientId: is the id you get by creating an installed app.
    ///   - redirectUri: is defined by the integrator by creating an installed app.
    ///   Must much with the URL Type in your settings.
    ///   - responseType: is by default `code` and has to be `code` to identify against Reddit.
    ///   - additionalParameters: add additional parameters to the login, such as `duration`.
    ///   `duration` is by default `permanent`.
    ///   - scopes: is a description of reddit's OAuth2 scopes. Scopes need to be set for certain calls.
    ///   For example you need a `identity` scope to access ``RedditModule/identityMe()``
    public init(
        clientId: String,
        redirectUri: String = "genericSDK://response",
        responseType: String = "code",
        additionalParameters: [String: String] = ["duration": "permanent"],
        scopes: @escaping () -> [String]
    ) {
        self.clientId = clientId
        self.redirectUri = redirectUri
        self.responseType = responseType
        self.additionalParameters = additionalParameters
        self.scopes = scopes
    }
}
