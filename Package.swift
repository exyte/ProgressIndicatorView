// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "ProgressIndicatorView",
    platforms: [
        .iOS(.v14),
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
            swiftSettings: [
                .enableExperimentalFeature("StrictConcurrency")
            ]
        )
    ]
)
