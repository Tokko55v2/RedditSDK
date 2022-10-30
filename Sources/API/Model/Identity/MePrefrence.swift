import Foundation

public struct MePrefrence: Codable {
    public let acceptPms: String?
    public let activityRelevantAds: Bool?
    public let allowClicktracking: Bool?
    public let badCommentAutocollapse: String?
    public let beta: Bool?
    public let clickgadget: Bool?
    public let collapseLeftBar: Bool?
    public let collapseReadMessages: Bool?
    public let compress: Bool?
    public let countryCode: String?
    public let defaultCommentSort: String?
    public let defaultThemeSr: String?
    public let designBeta: Bool?
    public let domainDetails: Bool?
    public let emailChatRequest: Bool?
    public let emailCommentReply: Bool?
    public let emailCommunityDiscovery: Bool?
    public let emailDigests: Bool?
    public let emailMessages: Bool?
    public let emailNewUserWelcome: Bool?
    public let emailPostReply: Bool?
    public let emailPrivateMessage: Bool?
    public let emailUnsubscribeAll: Bool?
    public let emailUpvoteComment: Bool?
    public let emailUpvotePost: Bool?
    public let emailUserNewFollower: Bool?
    public let emailUsernameMention: Bool?
    public let enableDefaultThemes: Bool?
    public let enableFollowers: Bool?
    public let feedRecommendationsEnabled: Bool?
    public let geopopular: String?
    public let hideAds: Bool?
    public let hideDowns: Bool?
    public let hideFromRobots: Bool?
    public let hideUps: Bool?
    public let highlightControversial: Bool?
    public let highlightNewComments: Bool?
    public let ignoreSuggestedSort: Bool?
    public let labelNsfw: Bool?
    public let lang: String?
    public let layout: String?
    public let legacySearch: Bool?
    public let liveBarRecommendationsEnabled: Bool?
    public let liveOrangereds: Bool?
    public let markMessagesRead: Bool?
    public let media: String?
    public let mediaPreview: String?
    public let minCommentScore: Int?
    public let minLinkScore: Int?
    public let monitorMentions: Bool?
    public let newwindow: Bool?
    public let nightmode: Bool?
    public let noProfanity: Bool?
    public let numComments: Int?
    public let numsites: Int?
    public let over18: Bool?
    public let privateFeeds: Bool?
    public let profileOptOut: Bool?
    public let publicServerSeconds: Bool?
    public let publicVotes: Bool?
    public let research: Bool?
    public let searchIncludeOver18: Bool?
    public let sendCrosspostMessages: Bool?
    public let sendWelcomeMessages: Bool?
    public let showFlair: Bool?
    public let showGoldExpiration: Bool?
    public let showLinkFlair: Bool?
    public let showLocationBasedRecommendations: Bool?
    public let showPresence: Bool?
    public let showSnoovatar: Bool?
    public let showStylesheets: Bool?
    public let showTrending: Bool?
    public let showTwitter: Bool?
    public let storeVisits: Bool?
    public let surveyLastSeenTime: String?
    public let thirdPartyDataPersonalizedAds: Bool?
    public let thirdPartyPersonalizedAds: Bool?
    public let thirdPartySiteDataPersonalizedAds: Bool?
    public let thirdPartySiteDataPersonalizedContent: Bool?
    public let threadedMessages: Bool?
    public let threadedModmail: Bool?
    public let topKarmaSubreddits: Bool?
    public let useGlobalDefaults: Bool?
    public let videoAutoplay: Bool?
    public let whatsappCommentReply: Bool?

    enum CodingKeys: String, CodingKey {
        case acceptPms = "accept_pms"
        case activityRelevantAds = "activity_relevant_ads"
        case allowClicktracking = "allow_clicktracking"
        case badCommentAutocollapse = "bad_comment_autocollapse"
        case beta
        case clickgadget
        case collapseLeftBar = "collapse_left_bar"
        case collapseReadMessages = "collapse_read_messages"
        case compress
        case countryCode = "country_code"
        case defaultCommentSort = "default_comment_sort"
        case defaultThemeSr = "default_theme_sr"
        case designBeta = "design_beta"
        case domainDetails = "domain_details"
        case emailChatRequest = "email_chat_request"
        case emailCommentReply = "email_comment_reply"
        case emailCommunityDiscovery = "email_community_discovery"
        case emailDigests = "email_digests"
        case emailMessages = "email_messages"
        case emailNewUserWelcome = "email_new_user_welcome"
        case emailPostReply = "email_post_reply"
        case emailPrivateMessage = "email_private_message"
        case emailUnsubscribeAll = "email_unsubscribe_all"
        case emailUpvoteComment = "email_upvote_comment"
        case emailUpvotePost = "email_upvote_post"
        case emailUserNewFollower = "email_user_new_follower"
        case emailUsernameMention = "email_username_mention"
        case enableDefaultThemes = "enable_default_themes"
        case enableFollowers = "enable_followers"
        case feedRecommendationsEnabled = "feed_recommendations_enabled"
        case geopopular
        case hideAds = "hide_ads"
        case hideDowns = "hide_downs"
        case hideFromRobots = "hide_from_robots"
        case hideUps = "hide_ups"
        case highlightControversial = "highlight_controversial"
        case highlightNewComments = "highlight_new_comments"
        case ignoreSuggestedSort = "ignore_suggested_sort"
        case labelNsfw = "label_nsfw"
        case lang
        case layout
        case legacySearch = "legacy_search"
        case liveBarRecommendationsEnabled = "live_bar_recommendations_enabled"
        case liveOrangereds = "live_orangereds"
        case markMessagesRead = "mark_messages_read"
        case media
        case mediaPreview = "media_preview"
        case minCommentScore = "min_comment_score"
        case minLinkScore = "min_link_score"
        case monitorMentions = "monitor_mentions"
        case newwindow
        case nightmode
        case noProfanity = "no_profanity"
        case numComments = "num_comments"
        case numsites
        case over18 = "over_18"
        case privateFeeds = "private_feeds"
        case profileOptOut = "profile_opt_out"
        case publicServerSeconds = "public_server_seconds"
        case publicVotes = "public_votes"
        case research
        case searchIncludeOver18 = "search_include_over_18"
        case sendCrosspostMessages = "send_crosspost_messages"
        case sendWelcomeMessages = "send_welcome_messages"
        case showFlair = "show_flair"
        case showGoldExpiration = "show_gold_expiration"
        case showLinkFlair = "show_link_flair"
        case showLocationBasedRecommendations = "show_location_based_recommendations"
        case showPresence = "show_presence"
        case showSnoovatar = "show_snoovatar"
        case showStylesheets = "show_stylesheets"
        case showTrending = "show_trending"
        case showTwitter = "show_twitter"
        case storeVisits = "store_visits"
        case surveyLastSeenTime = "survey_last_seen_time"
        case thirdPartyDataPersonalizedAds = "third_party_data_personalized_ads"
        case thirdPartyPersonalizedAds = "third_party_personalized_ads"
        case thirdPartySiteDataPersonalizedAds = "third_party_site_data_personalized_ads"
        case thirdPartySiteDataPersonalizedContent = "third_party_site_data_personalized_content"
        case threadedMessages = "threaded_messages"
        case threadedModmail = "threaded_modmail"
        case topKarmaSubreddits = "top_karma_subreddits"
        case useGlobalDefaults = "use_global_defaults"
        case videoAutoplay = "video_autoplay"
        case whatsappCommentReply = "whatsapp_comment_reply"
    }
}
