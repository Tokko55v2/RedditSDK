import Foundation

public struct IdentityMe: Codable {
    public let features: Feature?

    enum CodingKeys: String, CodingKey {
        case features
    }
}

public struct Feature: Codable {
    public let awardsOnStreams: Bool?
    public let chatGroupRollout: Bool?
    public let chatSubreddit: Bool?
    public let chatUserSettings: Bool?
    public let cookieConsentBanner: Bool?
    public let crowdControlForPost: Bool?
    public let doNotTrack: Bool?
    public let expensiveCoinsPackage: Bool?
    public let isEmailPermissionRequired: Bool?
    public let modAwards: Bool?
    public let modServiceMuteReads: Bool?
    public let modServiceMuteWrites: Bool?
    public let modlogCopyrightRemoval: Bool?
    public let mwebCommentsBanner: MwebCommentsBanner?
    public let mwebFooterUpsell: MwebCommentsBanner?
    public let mwebInFeedRefresh: MwebCommentsBanner?
    public let mwebSharingClipboard: MwebCommentsBanner?
    public let mwebXpromoInterstitialCommentsAndroid: Bool?
    public let mwebXpromoInterstitialCommentsIos: Bool?
    // swiftlint:disable identifier_name
    public let mwebXpromoModalListingClickDailyDismissibleAndroid: Bool?
    // swiftlint:disable identifier_name
    public let mwebXpromoModalListingClickDailyDismissibleIos: Bool?
    public let mwebXpromoRevampV2: MwebCommentsBanner?
    public let noreferrerToNoopener: Bool?
    public let premiumSubscriptionsTable: Bool?
    public let promotedTrendBlanks: Bool?
    public let resizedStylesImages: Bool?
    public let showAmpLink: Bool?
    public let spezModal: Bool?
    public let swapStepsTwoAndThreeRecalibration: MwebCommentsBanner?
    public let usePrefAccountDeployment: Bool?

    enum CodingKeys: String, CodingKey {
        case awardsOnStreams = "awards_on_streams"
        case chatGroupRollout = "chat_group_rollout"
        case chatSubreddit = "chat_subreddit"
        case chatUserSettings = "chat_user_settings"
        case cookieConsentBanner = "cookie_consent_banner"
        case crowdControlForPost = "crowd_control_for_post"
        case doNotTrack = "do_not_track"
        case expensiveCoinsPackage = "expensive_coins_package"
        case isEmailPermissionRequired = "is_email_permission_required"
        case modAwards = "mod_awards"
        case modServiceMuteReads = "mod_service_mute_reads"
        case modServiceMuteWrites = "mod_service_mute_writes"
        case modlogCopyrightRemoval = "modlog_copyright_removal"
        case mwebCommentsBanner = "mweb_comments_banner"
        case mwebFooterUpsell = "mweb_footer_upsell"
        case mwebInFeedRefresh = "mweb_in_feed_refresh"
        case mwebSharingClipboard = "mweb_sharing_clipboard"
        case mwebXpromoInterstitialCommentsAndroid = "mweb_xpromo_interstitial_comments_android"
        case mwebXpromoInterstitialCommentsIos = "mweb_xpromo_interstitial_comments_ios"
        // swiftlint:disable line_length
        case mwebXpromoModalListingClickDailyDismissibleAndroid = "mweb_xpromo_modal_listing_click_daily_dismissible_android"
        case mwebXpromoModalListingClickDailyDismissibleIos = "mweb_xpromo_modal_listing_click_daily_dismissible_ios"
        case mwebXpromoRevampV2 = "mweb_xpromo_revamp_v2"
        case noreferrerToNoopener = "noreferrer_to_noopener"
        case premiumSubscriptionsTable = "premium_subscriptions_table"
        case promotedTrendBlanks = "promoted_trend_blanks"
        case resizedStylesImages = "resized_styles_images"
        case showAmpLink = "show_amp_link"
        case spezModal = "spez_modal"
        case swapStepsTwoAndThreeRecalibration = "swap_steps_two_and_three_recalibration"
        case usePrefAccountDeployment = "use_pref_account_deployment"
    }
}

public struct MwebCommentsBanner: Codable {
    public let experimentId: Int?
    public let owner: String?
    public let variant: String?

    enum CodingKeys: String, CodingKey {
        case experimentId = "experiment_id"
        case owner
        case variant
    }
}
