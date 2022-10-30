import Foundation

public struct ReddiConfiguration {
    internal let clientId: String
    internal let redirectUri: String
    internal let responseType: String
    internal let additionalParameters: [String: String]
    internal let scopes: () -> [String]

    public init(
        clientId: String,
        redirecUri: String = "genericSDK://response",
        responseType: String = "code",
        additionalParameters: [String: String] = ["duration": "permanent"],
        scopes: @escaping () -> [String]
    ) {
        self.clientId = clientId
        redirectUri = redirecUri
        self.responseType = responseType
        self.additionalParameters = additionalParameters
        self.scopes = scopes
    }
}
