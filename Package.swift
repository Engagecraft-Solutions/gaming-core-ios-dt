// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "gaming-core-ios",
    defaultLocalization: "en",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "GamesLib", targets: ["CoreTarget"]),//GHMainTheme
        .library(name: "GHMainTheme", targets: ["GHMainTheme"])
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire", exact: "5.9.1"),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON", exact: "5.0.2"),
        .package(url: "https://github.com/onevcat/Kingfisher", from: "7.11.0"),
        .package(url: "https://github.com/auth0/Auth0.swift", from: "2.18.0"),
        .package(url: "https://github.com/SourcePointUSA/ios-cmp-app",from: "7.12.2"),
        .package(url: "https://github.com/tealium/tealium-swift", from: "2.18.3"),
    ],
    targets: [
        .target( 
            name: "CoreTarget",
            dependencies: [
                "CoreBinary", 
                  .product(name: "Alamofire", package: "Alamofire"),
                  .product(name: "SwiftyJSON", package: "SwiftyJSON"),
                  .product(name: "Kingfisher", package: "Kingfisher"),
                  .product(name: "Auth0", package: "Auth0.swift"),
                  .product(name: "ConsentViewController", package: "ios-cmp-app"),
                  .product(name: "TealiumAutotracking", package: "tealium-swift"), // DT
                .product(name: "TealiumCore", package: "tealium-swift"), // DT
                .product(name: "TealiumLifecycle", package: "tealium-swift"), // DT
                .product(name: "TealiumAttribution", package: "tealium-swift"), // DT
                .product(name: "TealiumCollect", package: "tealium-swift"),
                .product(name: "TealiumRemoteCommands", package: "tealium-swift"), // DT
                .product(name: "TealiumTagManagement", package: "tealium-swift"), // DT
            ],
        ),   
        .binaryTarget(
            name: "CoreBinary", 
            path: "GamesLib.xcframework"
        ),
        .target(
             name: "GHMainTheme",
             path: "Sources/MainThemeFull",
             resources: [
                 .process("Assets")
             ]
         ),
    ],
    swiftLanguageVersions: [.v5]
)
