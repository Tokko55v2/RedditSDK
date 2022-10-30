import Combine
import SwiftUI

public protocol RedditModule {
    /// Returns an `URL` that takes the client to the Login site for the OAuth2 authentication.
    /// When this is done user get's redirected.
    /// To finish the login process successful call ``handleLoginRespone(url:)`` and pass on the response URI
    ///
    /// - Returns: a `URL` to the OAuth2 Login
    func login() -> AnyPublisher<URL, ApiError>

    /// After a successful login and allowing the App to act on a user behavoire
    func handleLoginRespone(url: URL) -> AnyPublisher<Void, ApiError>

    // MARK: Identity

    /// `/api/v1/me`
    /// Returns the identity of the user.
    ///
    /// - Returns: AnyPublisher<Me, ApiError>
    func identityMe() -> AnyPublisher<IdentityMe, ApiError>

    /// `/api/v1/me/prefs`
    /// Return the preference settings of the logged in user
    ///
    /// - Returns: AnyPublisher<MePrefrence, ApiError>
    func identityMePrefs() -> AnyPublisher<MePrefrence, ApiError>

    /// `/api/v1/me/trophies`
    /// Return a list of trophies for the current user.
    ///
    /// - Returns: AnyPublisher<Me, ApiError>
    func identityMeTrophies() -> AnyPublisher<IdentityMe, ApiError>

    // MARK: Any Scope

    /// `/api/username_available`
    /// Check whether a username is available for registration.
    ///
    /// - Parameters: username `String`
    /// - Returns: AnyPublisher<Bool, ApiError>
    func usernameAvailable(username: String) -> AnyPublisher<Bool, ApiError>

    // MARK: Manage My Flair

    /// Return list of available link flair for the current subreddit.
    /// Will not return flair if the user cannot set their own link flair and
    /// they are not a moderator that can set flair.
    ///
    /// - Parameters: subreddit `String`
    /// - Returns: AnyPublisher<LinkFlair, ApiError>
    func linkFlair(subreddit: String) -> AnyPublisher<[LinkFlair2], ApiError>
}
