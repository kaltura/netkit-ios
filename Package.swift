// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "KalturaNetKit",
    platforms: [
        .iOS(.v9), .tvOS(.v9)
    ],
    products: [
        .library(
            name: "KalturaNetKit",
            targets: ["KalturaNetKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "4.3.0")
    ],
    targets: [
        .target(
            name: "KalturaNetKit",
            dependencies: ["SwiftyJSON"],
            path: "NetKit/Classes/Core"),
        .testTarget(
            name: "KalturaNetKitTests",
            dependencies: ["KalturaNetKit"]),
    ]
)
