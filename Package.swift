// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "ProgressIndicatorView",
    platforms: [
        .macOS(.v11),
        .iOS(.v15),
        .watchOS(.v7),
        .tvOS(.v14)
    ],
    products: [
        .library(
            name: "ProgressIndicatorView", 
            targets: ["ProgressIndicatorView"]
        )
    ],
    targets: [
        .target(
            name: "ProgressIndicatorView",
            path: "Source"
        )
    ],
    swiftLanguageVersions: [.v5]
)