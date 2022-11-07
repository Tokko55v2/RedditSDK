import Combine
import SwiftUI

/// Provides the integrator with the needed APIs.
public protocol RedditModule {
    /// Returns an `URL` that takes the client to the Login site for the OAuth2 authentication.
    /// If successful Reddit returns a redirect URI.
    /// Register this response URI and pass it on to ``RedditModule/handleLoginResponse(url:)``
    ///
    /// - Returns: a `URL` to the OAuth2 Login. It is recommended to open the URL with a `SFViewController`.
    func login() -> AnyPublisher<URL, ApiError>

    /// Pass the response URL getting from OAuth2 after a successful login to``RedditModule/handleLoginResponse(url:)``
    ///
    /// - Parameter url: Response url from the OAuth2.
    /// - Returns: AnyPublisher<Void, ApiError>
    func handleLoginResponse(url: URL) -> AnyPublisher<Void, ApiError>

    // MARK: Identity

    /// The identity of the user.
    ///
    /// - HTTP:  GET **/api/v1/me**
    /// - OAuth2 Scope: `identity`
    /// - Returns: AnyPublisher<IdentityMe, ApiError>
    func identityMe() -> AnyPublisher<IdentityMe, ApiError>

    /// The preference settings of the logged in user
    ///
    /// - HTTP: GET **/api/v1/me/prefs**
    /// - OAuth2 Scope: `identity`
    ///
    /// - Returns: AnyPublisher<MePreference, ApiError>
    func identityMePreference() -> AnyPublisher<MePrefrence, ApiError>

    /// A list of trophies for the current user.
    ///
    /// - HTTP: GET  **/api/v1/me/trophies**
    /// - OAuth2 Scope: `identity`
    /// - Returns: AnyPublisher<Void, ApiError>
    func identityMeTrophies() -> AnyPublisher<Void, ApiError>

    // MARK: Any Scope

    /// Check whether a username is available for registration.
    ///
    /// - HTTP:  GET **/api/username_available**
    /// - OAuth2 Scope: `any`
    ///
    /// - Parameters: username `String`
    /// - Returns: AnyPublisher<Bool, ApiError>
    func usernameAvailable(username: String) -> AnyPublisher<Bool, ApiError>

    // MARK: Manage My Flair

    /// List of available link flair for the current subreddit.
    /// Will not return flair if the user cannot set their own link flair and
    /// they are not a moderator that can set flair.
    ///
    /// - HTTP: GET **[/r/subreddit]/api/link_flair_v2**
    /// - OAuth2 Scope: `flair`
    /// - Parameters: subreddit `String`
    /// - Returns: AnyPublisher<[LinkFlair], ApiError>
    func linkFlair(subreddit: String) -> AnyPublisher<[LinkFlair2], ApiError>
}
