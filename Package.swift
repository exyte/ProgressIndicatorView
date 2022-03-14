// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "ProgressIndicatorView",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13)
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