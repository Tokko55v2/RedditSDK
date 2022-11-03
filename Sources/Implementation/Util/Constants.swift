import Foundation

struct Constants {
    static var authorizationEndpoint: URL {
        guard let url = URL(string: "https://www.reddit.com/api/v1/authorize") else {
            fatalError("Authorization endpoint could wrap to URL")
        }
        return url
    }

    static var tokenEndpoint: URL {
        guard let url = URL(string: "https://www.reddit.com/api/v1/access_token") else {
            fatalError("Token endpoint could wrap to URL")
        }
        return url
    }
}
