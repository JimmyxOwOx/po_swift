import Foundation

let sampleArtworks: [ArtworkInfo] = [
    ArtworkInfo(
        imageName: "Main 1",
        owner: sampleUsers[0],
        creator: sampleUsers[1],
        artworkTitle: "Sunset Overdrive",
        historyOfOwners: [sampleUsers[0], sampleUsers[2], sampleUsers[3]],
        size: "1920x1080",
        dpi: 72,
        createdDate: Date(),
        tradeAvailable: false,
        swipeAvailable: true,
        passport: true,
        introduction: "A breathtaking depiction of a sunset with vibrant colors.",
        audioIntroduction: nil,
        tradeInfo: TradeInfo(
            currentPrice: "$190",
            historyPrice: "$180",
            historyOwner: "Seller_pic1",
            tradeDate: Date(),
            historyTransactions: [
                ("$190", "$180", "Jan 27, 2024", "Seller_pic1"),
                ("$180", "$170", "Jan 27, 2024", "Seller_pic2"),
                ("$130", "$120", "Jan 23, 2024", "Seller_pic3"),
                ("$100", "$90", "Jan 03, 2024", "Seller_pic4")
            ]
        ),
        interestedInSwapping: [sampleUsers[4], sampleUsers[5]], // 示例数据
        interestedInBuying: [sampleUsers[6], sampleUsers[7]],   // 示例数据
        tags: ["sunset", "vibrant", "landscape"]                // 示例标签
    ),
    ArtworkInfo(
        imageName: "Main 2",
        owner: sampleUsers[2],
        creator: sampleUsers[3],
        artworkTitle: "Whispering Woods",
        historyOfOwners: [sampleUsers[2], sampleUsers[4], sampleUsers[5]],
        size: "1920x1080",
        dpi: 72,
        createdDate: Date(),
        tradeAvailable: true,
        swipeAvailable: false,
        passport: true,
        introduction: "A serene forest scene that captures the essence of tranquility.",
        audioIntroduction: nil,
        tradeInfo: TradeInfo(
            currentPrice: "$200",
            historyPrice: "$190",
            historyOwner: "Seller_pic2",
            tradeDate: Date(),
            historyTransactions: [
                ("$200", "$190", "Feb 10, 2024", "Seller_pic2"),
                ("$190", "$180", "Feb 05, 2024", "Seller_pic3"),
                ("$150", "$140", "Feb 01, 2024", "Seller_pic4"),
                ("$120", "$110", "Jan 25, 2024", "Seller_pic5")
            ]
        ),
        interestedInSwapping: [sampleUsers[8], sampleUsers[9]], // 示例数据
        interestedInBuying: [sampleUsers[10], sampleUsers[11]], // 示例数据
        tags: ["forest", "serene", "tranquility"]               // 示例标签
    ),
    ArtworkInfo(
        imageName: "Main 3",
        owner: sampleUsers[4],
        creator: sampleUsers[5],
        artworkTitle: "City Lights",
        historyOfOwners: [sampleUsers[4], sampleUsers[6], sampleUsers[7]],
        size: "1920x1080",
        dpi: 72,
        createdDate: Date(),
        tradeAvailable: true,
        swipeAvailable: true,
        passport: true,
        introduction: "An electrifying view of a city illuminated at night.",
        audioIntroduction: nil,
        tradeInfo: TradeInfo(
            currentPrice: "$210",
            historyPrice: "$200",
            historyOwner: "Seller_pic3",
            tradeDate: Date(),
            historyTransactions: [
                ("$210", "$200", "Mar 10, 2024", "Seller_pic3"),
                ("$200", "$190", "Mar 05, 2024", "Seller_pic4"),
                ("$160", "$150", "Mar 01, 2024", "Seller_pic5"),
                ("$130", "$120", "Feb 25, 2024", "Seller_pic6")
            ]
        ),
        interestedInSwapping: [sampleUsers[12], sampleUsers[13]], // 示例数据
        interestedInBuying: [sampleUsers[14], sampleUsers[15]],    // 示例数据
        tags: ["city", "night", "lights"]                         // 示例标签
    ),
    ArtworkInfo(
        imageName: "Main 4",
        owner: sampleUsers[6],
        creator: sampleUsers[7],
        artworkTitle: "Ocean Breeze",
        historyOfOwners: [sampleUsers[6], sampleUsers[8], sampleUsers[9]],
        size: "1920x1080",
        dpi: 72,
        createdDate: Date(),
        tradeAvailable: false,
        swipeAvailable: true,
        passport: true,
        introduction: "A refreshing scene of the ocean with gentle waves and a clear sky.",
        audioIntroduction: nil,
        tradeInfo: TradeInfo(
            currentPrice: "$220",
            historyPrice: "$210",
            historyOwner: "Seller_pic4",
            tradeDate: Date(),
            historyTransactions: [
                ("$220", "$210", "Apr 10, 2024", "Seller_pic4"),
                ("$210", "$200", "Apr 05, 2024", "Seller_pic5"),
                ("$170", "$160", "Apr 01, 2024", "Seller_pic6"),
                ("$140", "$130", "Mar 25, 2024", "Seller_pic7")
            ]
        ),
        interestedInSwapping: [sampleUsers[16], sampleUsers[17]], // 示例数据
        interestedInBuying: [sampleUsers[18], sampleUsers[19]],    // 示例数据
        tags: ["ocean", "breeze", "waves"]                        // 示例标签
    ),
    ArtworkInfo(
        imageName: "Main 5",
        owner: sampleUsers[8],
        creator: sampleUsers[9],
        artworkTitle: "Mountain Majesty",
        historyOfOwners: [sampleUsers[8], sampleUsers[10], sampleUsers[11]],
        size: "1920x1080",
        dpi: 72,
        createdDate: Date(),
        tradeAvailable: true,
        swipeAvailable: false,
        passport: true,
        introduction: "A stunning portrayal of towering mountains under a clear blue sky.",
        audioIntroduction: nil,
        tradeInfo: TradeInfo(
            currentPrice: "$230",
            historyPrice: "$220",
            historyOwner: "Seller_pic5",
            tradeDate: Date(),
            historyTransactions: [
                ("$230", "$220", "May 10, 2024", "Seller_pic5"),
                ("$220", "$210", "May 05, 2024", "Seller_pic6"),
                ("$180", "$170", "May 01, 2024", "Seller_pic7"),
                ("$150", "$140", "Apr 25, 2024", "Seller_pic8")
            ]
        ),
        interestedInSwapping: [sampleUsers[20], sampleUsers[21]], // 示例数据
        interestedInBuying: [sampleUsers[22], sampleUsers[23]],    // 示例数据
        tags: ["mountain", "majesty", "sky"]                       // 示例标签
    ),
    ArtworkInfo(
        imageName: "Main 6",
        owner: sampleUsers[10],
        creator: sampleUsers[11],
        artworkTitle: "Golden Fields",
        historyOfOwners: [sampleUsers[10], sampleUsers[12], sampleUsers[13]],
        size: "1920x1080",
        dpi: 72,
        createdDate: Date(),
        tradeAvailable: true,
        swipeAvailable: true,
        passport: true,
        introduction: "A beautiful landscape of golden fields under a setting sun.",
        audioIntroduction: nil,
        tradeInfo: TradeInfo(
            currentPrice: "$240",
            historyPrice: "$230",
            historyOwner: "Seller_pic6",
            tradeDate: Date(),
            historyTransactions: [
                ("$240", "$230", "Jun 10, 2024", "Seller_pic6"),
                ("$230", "$220", "Jun 05, 2024", "Seller_pic7"),
                ("$190", "$180", "Jun 01, 2024", "Seller_pic8"),
                ("$160", "$150", "May 25, 2024", "Seller_pic9")
            ]
        ),
        interestedInSwapping: [sampleUsers[0], sampleUsers[1]],   // 示例数据
        interestedInBuying: [sampleUsers[2], sampleUsers[3]],      // 示例数据
        tags: ["golden", "fields", "sunset"]                      // 示例标签
    ),
    ArtworkInfo(
        imageName: "Main 7",
        owner: sampleUsers[12],
        creator: sampleUsers[13],
        artworkTitle: "Autumn Leaves",
        historyOfOwners: [sampleUsers[12], sampleUsers[14], sampleUsers[15]],
        size: "1920x1080",
        dpi: 72,
        createdDate: Date(),
        tradeAvailable: false,
        swipeAvailable: true,
        passport: true,
        introduction: "A vibrant display of autumn leaves in their full glory.",
        audioIntroduction: nil,
        tradeInfo: TradeInfo(
            currentPrice: "$250",
            historyPrice: "$240",
            historyOwner: "Seller_pic7",
            tradeDate: Date(),
            historyTransactions: [
                ("$250", "$240", "Jul 10, 2024", "Seller_pic7"),
                ("$240", "$230", "Jul 05, 2024", "Seller_pic8"),
                ("$200", "$190", "Jul 01, 2024", "Seller_pic9"),
                ("$170", "$160", "Jun 25, 2024", "Seller_pic10")
            ]
        ),
        interestedInSwapping: [sampleUsers[4], sampleUsers[5]],   // 示例数据
        interestedInBuying: [sampleUsers[6], sampleUsers[7]],      // 示例数据
        tags: ["autumn", "leaves", "vibrant"]                     // 示例标签
    ),
    ArtworkInfo(
        imageName: "Main 8",
        owner: sampleUsers[14],
        creator: sampleUsers[15],
        artworkTitle: "Desert Mirage",
        historyOfOwners: [sampleUsers[14], sampleUsers[16], sampleUsers[17]],
        size: "1920x1080",
        dpi: 72,
        createdDate: Date(),
        tradeAvailable: true,
        swipeAvailable: false,
        passport: true,
        introduction: "A mysterious and enchanting view of a desert mirage.",
        audioIntroduction: nil,
        tradeInfo: TradeInfo(
            currentPrice: "$260",
            historyPrice: "$250",
            historyOwner: "Seller_pic8",
            tradeDate: Date(),
            historyTransactions: [
                ("$260", "$250", "Aug 10, 2024", "Seller_pic8"),
                ("$250", "$240", "Aug 05, 2024", "Seller_pic9"),
                ("$210", "$200", "Aug 01, 2024", "Seller_pic10"),
                ("$180", "$170", "Jul 25, 2024", "Seller_pic11")
            ]
        ),
        interestedInSwapping: [sampleUsers[8], sampleUsers[9]],   // 示例数据
        interestedInBuying: [sampleUsers[10], sampleUsers[11]],    // 示例数据
        tags: ["desert", "mirage", "enchanting"]                  // 示例标签
    ),
    ArtworkInfo(
        imageName: "Main 9",
        owner: sampleUsers[16],
        creator: sampleUsers[17],
        artworkTitle: "Winter Wonderland",
        historyOfOwners: [sampleUsers[16], sampleUsers[18], sampleUsers[19]],
        size: "1920x1080",
        dpi: 72,
        createdDate: Date(),
        tradeAvailable: true,
        swipeAvailable: true,
        passport: true,
        introduction: "A magical winter landscape with snow-covered trees.",
        audioIntroduction: nil,
        tradeInfo: TradeInfo(
            currentPrice: "$270",
            historyPrice: "$260",
            historyOwner: "Seller_pic9",
            tradeDate: Date(),
            historyTransactions: [
                ("$270", "$260", "Sep 10, 2024", "Seller_pic9"),
                ("$260", "$250", "Sep 05, 2024", "Seller_pic10"),
                ("$220", "$210", "Sep 01, 2024", "Seller_pic11"),
                ("$190", "$180", "Aug 25, 2024", "Seller_pic12")
            ]
        ),
        interestedInSwapping: [sampleUsers[12], sampleUsers[13]], // 示例数据
        interestedInBuying: [sampleUsers[14], sampleUsers[15]],    // 示例数据
        tags: ["winter", "wonderland", "snow"]                    // 示例标签
    ),
    ArtworkInfo(
        imageName: "Main 10",
        owner: sampleUsers[18],
        creator: sampleUsers[19],
        artworkTitle: "Spring Blossom",
        historyOfOwners: [sampleUsers[18], sampleUsers[20], sampleUsers[21]],
        size: "1920x1080",
        dpi: 72,
        createdDate: Date(),
        tradeAvailable: true,
        swipeAvailable: true,
        passport: true,
        introduction: "A delightful scene of blooming flowers in spring.",
        audioIntroduction: nil,
        tradeInfo: TradeInfo(
            currentPrice: "$280",
            historyPrice: "$270",
            historyOwner: "Seller_pic10",
            tradeDate: Date(),
            historyTransactions: [
                ("$280", "$270", "Oct 10, 2024", "Seller_pic10"),
                ("$270", "$260", "Oct 05, 2024", "Seller_pic11"),
                ("$230", "$220", "Oct 01, 2024", "Seller_pic12"),
                ("$200", "$190", "Sep 25, 2024", "Seller_pic13")
            ]
        ),
        interestedInSwapping: [sampleUsers[16], sampleUsers[17]], // 示例数据
        interestedInBuying: [sampleUsers[18], sampleUsers[19]],    // 示例数据
        tags: ["spring", "blossom", "flowers"]                    // 示例标签
    ),
    ArtworkInfo(
        imageName: "Main 11",
        owner: sampleUsers[20],
        creator: sampleUsers[21],
        artworkTitle: "Mystic River",
        historyOfOwners: [sampleUsers[20], sampleUsers[22], sampleUsers[23]],
        size: "1920x1080",
        dpi: 72,
        createdDate: Date(),
        tradeAvailable: true,
        swipeAvailable: true,
        passport: true,
        introduction: "A serene river flowing through a mystical forest.",
        audioIntroduction: nil,
        tradeInfo: TradeInfo(
            currentPrice: "$290",
            historyPrice: "$280",
            historyOwner: "Seller_pic11",
            tradeDate: Date(),
            historyTransactions: [
                ("$290", "$280", "Nov 10, 2024", "Seller_pic11"),
                ("$280", "$270", "Nov 05, 2024", "Seller_pic12"),
                ("$240", "$230", "Nov 01, 2024", "Seller_pic13"),
                ("$210", "$200", "Oct 25, 2024", "Seller_pic14")
            ]
        ),
        interestedInSwapping: [sampleUsers[0], sampleUsers[1]],   // 示例数据
        interestedInBuying: [sampleUsers[2], sampleUsers[3]],      // 示例数据
        tags: ["river", "mystic", "forest"]                       // 示例标签
    ),
    ArtworkInfo(
        imageName: "Main 12",
        owner: sampleUsers[22],
        creator: sampleUsers[23],
        artworkTitle: "Galaxy Quest",
        historyOfOwners: [sampleUsers[22], sampleUsers[0], sampleUsers[1]],
        size: "1920x1080",
        dpi: 72,
        createdDate: Date(),
        tradeAvailable: false,
        swipeAvailable: false,
        passport: true,
        introduction: "An awe-inspiring journey through the vastness of space.",
        audioIntroduction: nil,
        tradeInfo: TradeInfo(
            currentPrice: "$300",
            historyPrice: "$290",
            historyOwner: "Seller_pic12",
            tradeDate: Date(),
            historyTransactions: [
                ("$300", "$290", "Dec 10, 2024", "Seller_pic12"),
                ("$290", "$280", "Dec 05, 2024", "Seller_pic13"),
                ("$250", "$240", "Dec 01, 2024", "Seller_pic14"),
                ("$220", "$210", "Nov 25, 2024", "Seller_pic15")
            ]
        ),
        interestedInSwapping: [sampleUsers[4], sampleUsers[5]],   // 示例数据
        interestedInBuying: [sampleUsers[6], sampleUsers[7]],      // 示例数据
        tags: ["galaxy", "quest", "space"]                        // 示例标签
    )
]
