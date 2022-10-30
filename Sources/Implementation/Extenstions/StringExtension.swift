import Foundation

internal extension String {
    var toUrl: URL {
        guard let url = URL(string: self) else {
            fatalError("String could not wrapped to a URL!")
        }

        return url
    }
}
