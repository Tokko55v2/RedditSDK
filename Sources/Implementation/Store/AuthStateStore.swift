import AppAuth
import Foundation

internal enum AuthStateStore {
    static func setAuthState(_ authState: OIDAuthState) {
        guard let authState = try? NSKeyedArchiver.archivedData(
            withRootObject: authState,
            requiringSecureCoding: true
        ) else {
            return
        }
        // TODO: Save it to the Keychain not to the UserDefaults, bad practices! Not secure
        UserDefaults().set(authState, forKey: "authState")
    }

    static func getAuthState() -> OIDAuthState? {
        guard let authStateData = UserDefaults().data(forKey: "authState"),
              let unarchive = try? NSKeyedUnarchiver(forReadingFrom: authStateData),
              let authState = unarchive.decodeObject(of: OIDAuthState.self, forKey: NSKeyedArchiveRootObjectKey)
        else {
            return nil
        }
        return authState
    }

    static func clear() {
        UserDefaults().removeObject(forKey: "authState")
    }
}
