// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "KalturaNetKit",
    platforms: [.iOS(.v11),
                .tvOS(.v11)],
    products: [.library(name: "KalturaNetKit",
                        targets: ["KalturaNetKit"])],
    dependencies: [
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "5.0.0"),
    ],
    targets: [.target(name: "KalturaNetKit",
                      dependencies: ["SwiftyJSON"],
                      path: "NetKit/Classes/Core"),
//              .target(name: "KalturaNetKit/Services",
//                      dependencies: ["SwiftyJSON", "KalturaNetKit"],
//                      path: "NetKit/Classes/Services/")
    ]
)
