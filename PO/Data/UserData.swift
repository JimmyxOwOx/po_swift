import Foundation

let sampleUsers: [UserInfo] = [
    UserInfo(
        name: "Admin",
        password: "123",
        profile_picture_name: "Admin",
        userID: "I_am_Master",
        introduction: "The God of this PO App",
        ownedPictures: [],
        picturesSelling: [],
        followers: 666,
        following: 666,
        joinedDate: Date(),
        soldedAmount: 75,
        about: About(audio: "", video: "", text: "Emily enjoys creating surreal digital landscapes."),
        picturesSwapping: [],
        favoriteTags: ["digital", "surreal"],
        contact: Contact(phoneNumber: "123-456-7890", countryCode: "+1", country: "USA", email: "Admin@example.com")
    ),
    UserInfo(
        name: "Emily Smith",
        password: "password1",
        profile_picture_name: "User 1",
        userID: "em_smith",
        introduction: "A passionate artist with a love for digital art.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 120,
        following: 80,
        joinedDate: Date(),
        soldedAmount: 75,
        about: About(audio: "", video: "", text: "Emily enjoys creating surreal digital landscapes."),
        picturesSwapping: [],
        favoriteTags: ["digital", "surreal"],
        contact: Contact(phoneNumber: "234-567-8901", countryCode: "+1", country: "USA", email: "emily.smith@example.com")
    ),
    UserInfo(
        name: "James Johnson",
        password: "password2",
        profile_picture_name: "User 2",
        userID: "jj_artist",
        introduction: "An artist inspired by nature and wildlife.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 250,
        following: 200,
        joinedDate: Date(),
        soldedAmount: 90,
        about: About(audio: "", video: "", text: "James captures the essence of nature in his works."),
        picturesSwapping: [],
        favoriteTags: ["nature", "wildlife"],
        contact: Contact(phoneNumber: "345-678-9012", countryCode: "+1", country: "USA", email: "james.johnson@example.com")
    ),
    UserInfo(
        name: "Olivia Brown",
        password: "password3",
        profile_picture_name: "User 3",
        userID: "liv_brown",
        introduction: "A creative mind with a passion for abstract art.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 190,
        following: 150,
        joinedDate: Date(),
        soldedAmount: 60,
        about: About(audio: "", video: "", text: "Olivia's abstract art is both thought-provoking and beautiful."),
        picturesSwapping: [],
        favoriteTags: ["abstract", "creative"],
        contact: Contact(phoneNumber: "456-789-0123", countryCode: "+1", country: "USA", email: "olivia.brown@example.com")
    ),
    UserInfo(
        name: "William Davis",
        password: "password4",
        profile_picture_name: "User 4",
        userID: "will_d",
        introduction: "A photographer who loves capturing urban life.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 300,
        following: 250,
        joinedDate: Date(),
        soldedAmount: 85,
        about: About(audio: "", video: "", text: "William's urban photography brings the city to life."),
        picturesSwapping: [],
        favoriteTags: ["urban", "photography"],
        contact: Contact(phoneNumber: "567-890-1234", countryCode: "+1", country: "USA", email: "william.davis@example.com")
    ),
    UserInfo(
        name: "Sophia Martinez",
        password: "password5",
        profile_picture_name: "User 5",
        userID: "sophia_m",
        introduction: "An illustrator with a love for children's books.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 210,
        following: 180,
        joinedDate: Date(),
        soldedAmount: 50,
        about: About(audio: "", video: "", text: "Sophia's illustrations are whimsical and charming."),
        picturesSwapping: [],
        favoriteTags: ["illustration", "children"],
        contact: Contact(phoneNumber: "678-901-2345", countryCode: "+1", country: "USA", email: "sophia.martinez@example.com")
    ),
    UserInfo(
        name: "Benjamin Garcia",
        password: "password6",
        profile_picture_name: "User 6",
        userID: "ben_garcia",
        introduction: "A mixed media artist with a unique perspective.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 280,
        following: 240,
        joinedDate: Date(),
        soldedAmount: 70,
        about: About(audio: "", video: "", text: "Benjamin combines different media to create stunning pieces."),
        picturesSwapping: [],
        favoriteTags: ["mixed media", "unique"],
        contact: Contact(phoneNumber: "789-012-3456", countryCode: "+1", country: "USA", email: "benjamin.garcia@example.com")
    ),
    UserInfo(
        name: "Isabella Rodriguez",
        password: "password7",
        profile_picture_name: "User 7",
        userID: "isa_rodriguez",
        introduction: "A painter who loves capturing human emotions.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 170,
        following: 140,
        joinedDate: Date(),
        soldedAmount: 65,
        about: About(audio: "", video: "", text: "Isabella's paintings evoke deep emotional responses."),
        picturesSwapping: [],
        favoriteTags: ["painting", "emotions"],
        contact: Contact(phoneNumber: "890-123-4567", countryCode: "+1", country: "USA", email: "isabella.rodriguez@example.com")
    ),
    UserInfo(
        name: "Liam Wilson",
        password: "password8",
        profile_picture_name: "User 8",
        userID: "liam_w",
        introduction: "A street artist bringing color to urban spaces.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 320,
        following: 270,
        joinedDate: Date(),
        soldedAmount: 80,
        about: About(audio: "", video: "", text: "Liam's street art is vibrant and thought-provoking."),
        picturesSwapping: [],
        favoriteTags: ["street art", "urban"],
        contact: Contact(phoneNumber: "901-234-5678", countryCode: "+1", country: "USA", email: "liam.wilson@example.com")
    ),
    UserInfo(
        name: "Mia Lee",
        password: "password9",
        profile_picture_name: "User 9",
        userID: "mia_lee",
        introduction: "An artist who specializes in minimalist designs.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 200,
        following: 170,
        joinedDate: Date(),
        soldedAmount: 55,
        about: About(audio: "", video: "", text: "Mia's minimalist designs are elegant and sophisticated."),
        picturesSwapping: [],
        favoriteTags: ["minimalist", "elegant"],
        contact: Contact(phoneNumber: "012-345-6789", countryCode: "+1", country: "USA", email: "mia.lee@example.com")
    ),
    UserInfo(
        name: "Noah Martinez",
        password: "password10",
        profile_picture_name: "User 10",
        userID: "noah_m",
        introduction: "A digital artist exploring futuristic themes.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 260,
        following: 220,
        joinedDate: Date(),
        soldedAmount: 95,
        about: About(audio: "", video: "", text: "Noah's digital art explores futuristic and sci-fi themes."),
        picturesSwapping: [],
        favoriteTags: ["digital", "futuristic"],
        contact: Contact(phoneNumber: "123-456-7890", countryCode: "+1", country: "USA", email: "noah.martinez@example.com")
    ),
    UserInfo(
        name: "Ava Harris",
        password: "password11",
        profile_picture_name: "User 11",
        userID: "ava_harris",
        introduction: "A sculptor who works with recycled materials.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 180,
        following: 150,
        joinedDate: Date(),
        soldedAmount: 50,
        about: About(audio: "", video: "", text: "Ava's sculptures are made from recycled materials."),
        picturesSwapping: [],
        favoriteTags: ["sculpture", "recycled"],
        contact: Contact(phoneNumber: "234-567-8901", countryCode: "+1", country: "USA", email: "ava.harris@example.com")
    ),
    UserInfo(
        name: "Lucas Clark",
        password: "password12",
        profile_picture_name: "User 12",
        userID: "lucas_clark",
        introduction: "A visual artist experimenting with new media.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 220,
        following: 180,
        joinedDate: Date(),
        soldedAmount: 75,
        about: About(audio: "", video: "", text: "Lucas experiments with new media to create his art."),
        picturesSwapping: [],
        favoriteTags: ["visual art", "new media"],
        contact: Contact(phoneNumber: "345-678-9012", countryCode: "+1", country: "USA", email: "lucas.clark@example.com")
    ),
    UserInfo(
        name: "Charlotte Lewis",
        password: "password13",
        profile_picture_name: "User 13",
        userID: "charlotte_l",
        introduction: "A graphic designer who loves bold colors.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 210,
        following: 160,
        joinedDate: Date(),
        soldedAmount: 85,
        about: About(audio: "", video: "", text: "Charlotte's graphic designs are known for their bold colors."),
        picturesSwapping: [],
        favoriteTags: ["graphic design", "bold colors"],
        contact: Contact(phoneNumber: "456-789-0123", countryCode: "+1", country: "USA", email: "charlotte.lewis@example.com")
    ),
    UserInfo(
        name: "Mason Young",
        password: "password14",
        profile_picture_name: "User 14",
        userID: "mason_y",
        introduction: "An animator bringing stories to life.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 250,
        following: 200,
        joinedDate: Date(),
        soldedAmount: 90,
        about: About(audio: "", video: "", text: "Mason's animations bring stories to life."),
        picturesSwapping: [],
        favoriteTags: ["animation", "storytelling"],
        contact: Contact(phoneNumber: "567-890-1234", countryCode: "+1", country: "USA", email: "mason.young@example.com")
    ),
    UserInfo(
        name: "Amelia Walker",
        password: "password15",
        profile_picture_name: "User 15",
        userID: "amelia_w",
        introduction: "An art teacher who loves sharing her skills.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 150,
        following: 120,
        joinedDate: Date(),
        soldedAmount: 60,
        about: About(audio: "", video: "", text: "Amelia loves teaching art and sharing her skills."),
        picturesSwapping: [],
        favoriteTags: ["teaching", "skills"],
        contact: Contact(phoneNumber: "678-901-2345", countryCode: "+1", country: "USA", email: "amelia.walker@example.com")
    ),
    UserInfo(
        name: "Elijah Hall",
        password: "password16",
        profile_picture_name: "User 16",
        userID: "elijah_h",
        introduction: "A portrait artist capturing the essence of people.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 230,
        following: 190,
        joinedDate: Date(),
        soldedAmount: 80,
        about: About(audio: "", video: "", text: "Elijah's portraits capture the essence of people."),
        picturesSwapping: [],
        favoriteTags: ["portrait", "people"],
        contact: Contact(phoneNumber: "789-012-3456", countryCode: "+1", country: "USA", email: "elijah.hall@example.com")
    ),
    UserInfo(
        name: "Evelyn Allen",
        password: "password17",
        profile_picture_name: "User 17",
        userID: "evelyn_allen",
        introduction: "A conceptual artist exploring modern themes.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 190,
        following: 150,
        joinedDate: Date(),
        soldedAmount: 70,
        about: About(audio: "", video: "", text: "Evelyn's conceptual art explores modern themes."),
        picturesSwapping: [],
        favoriteTags: ["conceptual", "modern"],
        contact: Contact(phoneNumber: "890-123-4567", countryCode: "+1", country: "USA", email: "evelyn.allen@example.com")
    ),
    UserInfo(
        name: "Henry King",
        password: "password18",
        profile_picture_name: "User 18",
        userID: "henry_k",
        introduction: "A fine art photographer with a unique vision.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 280,
        following: 240,
        joinedDate: Date(),
        soldedAmount: 75,
        about: About(audio: "", video: "", text: "Henry's fine art photography captures unique visions."),
        picturesSwapping: [],
        favoriteTags: ["fine art", "photography"],
        contact: Contact(phoneNumber: "901-234-5678", countryCode: "+1", country: "USA", email: "henry.king@example.com")
    ),
    UserInfo(
        name: "Ella Wright",
        password: "password19",
        profile_picture_name: "User 19",
        userID: "ella_wright",
        introduction: "A calligrapher creating beautiful hand lettering.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 160,
        following: 120,
        joinedDate: Date(),
        soldedAmount: 55,
        about: About(audio: "", video: "", text: "Ella's calligraphy is elegant and beautiful."),
        picturesSwapping: [],
        favoriteTags: ["calligraphy", "elegant"],
        contact: Contact(phoneNumber: "012-345-6789", countryCode: "+1", country: "USA", email: "ella.wright@example.com")
    ),
    UserInfo(
        name: "Aiden Lopez",
        password: "password20",
        profile_picture_name: "User 20",
        userID: "aiden_lopez",
        introduction: "An illustrator with a love for fantasy art.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 240,
        following: 200,
        joinedDate: Date(),
        soldedAmount: 85,
        about: About(audio: "", video: "", text: "Aiden's fantasy art is magical and captivating."),
        picturesSwapping: [],
        favoriteTags: ["illustration", "fantasy"],
        contact: Contact(phoneNumber: "123-456-7890", countryCode: "+1", country: "USA", email: "aiden.lopez@example.com")
    ),
    UserInfo(
        name: "Grace Hill",
        password: "password21",
        profile_picture_name: "User 21",
        userID: "grace_hill",
        introduction: "A painter inspired by the beauty of nature.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 170,
        following: 140,
        joinedDate: Date(),
        soldedAmount: 60,
        about: About(audio: "", video: "", text: "Grace's paintings are inspired by the beauty of nature."),
        picturesSwapping: [],
        favoriteTags: ["painting", "nature"],
        contact: Contact(phoneNumber: "234-567-8901", countryCode: "+1", country: "USA", email: "grace.hill@example.com")
    ),
    UserInfo(
        name: "Sebastian Scott",
        password: "password22",
        profile_picture_name: "User 22",
        userID: "seb_s",
        introduction: "A muralist bringing art to public spaces.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 260,
        following: 220,
        joinedDate: Date(),
        soldedAmount: 70,
        about: About(audio: "", video: "", text: "Sebastian's murals bring art to public spaces."),
        picturesSwapping: [],
        favoriteTags: ["mural", "public"],
        contact: Contact(phoneNumber: "345-678-9012", countryCode: "+1", country: "USA", email: "sebastian.scott@example.com")
    ),
    UserInfo(
        name: "Harper Green",
        password: "password23",
        profile_picture_name: "User 23",
        userID: "harper_g",
        introduction: "A jewelry designer with a passion for detail.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 180,
        following: 150,
        joinedDate: Date(),
        soldedAmount: 65,
        about: About(audio: "", video: "", text: "Harper's jewelry designs are intricate and beautiful."),
        picturesSwapping: [],
        favoriteTags: ["jewelry", "detail"],
        contact: Contact(phoneNumber: "456-789-0123", countryCode: "+1", country: "USA", email: "harper.green@example.com")
    ),
    UserInfo(
        name: "Jack Adams",
        password: "password24",
        profile_picture_name: "User 24",
        userID: "jack_a",
        introduction: "A graphic novelist creating compelling stories.",
        ownedPictures: [],
        picturesSelling: [],
        followers: 220,
        following: 180,
        joinedDate: Date(),
        soldedAmount: 90,
        about: About(audio: "", video: "", text: "Jack's graphic novels tell compelling stories."),
        picturesSwapping: [],
        favoriteTags: ["graphic novel", "stories"],
        contact: Contact(phoneNumber: "567-890-1234", countryCode: "+1", country: "USA", email: "jack.adams@example.com")
    ),
    UserInfo(
       name: "Nelsonphyang",
       password: "password25",
       profile_picture_name: "Userprofile_picture",
       userID: "nelsonphyang",
       introduction: "我是楊博華尼爾森,一名插畫家，歡迎與我互動！",
       ownedPictures: [],
       picturesSelling: [],
       followers: 9999,
       following: 666,
       joinedDate: Date(),
       soldedAmount: 120,
       about: About(audio: "", video: "", text: "我是楊博華尼爾森,一名插畫家，歡迎與我互動！"),
       picturesSwapping: [],
       favoriteTags: ["illustration", "interaction"],
       contact: Contact(phoneNumber: "987-654-321", countryCode: "+886", country: "Taiwan", email: "nelsonphyang@example.com")
    )
]
