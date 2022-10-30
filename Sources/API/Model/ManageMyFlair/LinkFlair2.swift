import Foundation

public struct LinkFlair2: Codable {
    public let allowableContent: String?
    public let backgroundColor: String?
    public let cssClass: String?
    public let id: String?
    public let maxEmojis: Int?
    public let modOnly: Bool?
    public let richtext: [String]?
    public let text: String?
    public let textColor: String?
    public let textEditable: Bool?
    public let type: String?

    enum CodingKeys: String, CodingKey {
        case allowableContent = "allowable_content"
        case backgroundColor = "background_color"
        case cssClass = "css_class"
        case id
        case maxEmojis = "max_emojis"
        case modOnly = "mod_only"
        case richtext
        case text
        case textColor = "text_color"
        case textEditable = "text_editable"
        case type
    }
}
