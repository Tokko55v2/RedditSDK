import Foundation

enum Endpoint {
    var baseUrl: String {
        "https://oauth.reddit.com"
    }

    // MARK: Identity

    case identityMe
    case identityMePrefs
    case identityMeTrophies

    // MARK: Account

    case accountBlockeUser

    // MARK: Any Scope

    case usernameAvailable

    // MARK: Manage My Flair

    case linkFlair(String)

    var url: URL {
        switch self {
        case .identityMe:
            return URL(string: "\(baseUrl)/api/v1/me")!
        case .identityMePrefs:
            return URL(string: "\(baseUrl)/api/v1/me/prefs")!
        case .identityMeTrophies:
            return URL(string: "\(baseUrl)/api/v1/me/trophies")!
        case .accountBlockeUser:
            return URL(string: "\(baseUrl)/api/block_user")!
        case .usernameAvailable:
            return URL(string: "\(baseUrl)/api/username_available")!
        case let .linkFlair(subreddit):
            return URL(string: "\(baseUrl)/r/\(subreddit)/api/link_flair")!
        }
    }
}
