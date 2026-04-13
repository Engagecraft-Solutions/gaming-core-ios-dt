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
        .package(url: "https://github.com/auth0/Auth0.swift", from: "2.18.0")
    ],
    targets: [
        .target( 
            name: "CoreTarget",
            dependencies: [
                "CoreBinary", 
                  .product(name: "Alamofire", package: "Alamofire"),
                  .product(name: "SwiftyJSON", package: "SwiftyJSON"),
                  .product(name: "Kingfisher", package: "Kingfisher"),
                  .product(name: "Auth0", package: "Auth0.swift")
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
