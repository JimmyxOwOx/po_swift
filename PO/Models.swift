import Foundation

struct Contact {
    let phoneNumber: String
    let countryCode: String
    let country: String
    let email: String
}

struct UserInfo: Identifiable {
    let id = UUID()
    let name: String
    var password: String
    var profile_picture_name: String
    let userID: String
    var introduction: String
    var ownedPictures: [String]
    var picturesSelling: [String]
    var followers: Int
    var following: Int
    let joinedDate: Date
    var soldedAmount: Int
    var about: About
    var picturesSwapping: [String]
    var favoriteTags: [String]
    var profilePictureData: Data? // 新增字段：用户头像数据
    let contact: Contact // 新增的 contact 属性
}

struct About {
    var audio: String
    var video: String
    var text: String
}

struct ArtworkInfo: Identifiable {
    let id = UUID()
    let imageName: String
    var owner: UserInfo
    let creator: UserInfo
    let artworkTitle: String
    var historyOfOwners: [UserInfo]
    let size: String
    let dpi: Int
    let createdDate: Date
    var tradeAvailable: Bool
    var swipeAvailable: Bool
    let passport: Bool
    let introduction: String
    let audioIntroduction: URL?
    var tradeInfo: TradeInfo
    var interestedInSwapping: [UserInfo] // 新增字段：期望交换这个作品的用户
    var interestedInBuying: [UserInfo]   // 新增字段：想要购买这个作品的用户
    var tags: [String]                   // 新增字段：作品的标签
}

struct TradeInfo {
    var currentPrice: String
    var historyPrice: String
    var historyOwner: String
    let tradeDate: Date
    var historyTransactions: [(String, String, String, String)]
}
