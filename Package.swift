// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "ProgressIndicatorView",
    platforms: [
        .iOS(.v15),
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7)
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
            path: "Sources"
        )
    ],
    swiftLanguageVersions: [.v5]
)