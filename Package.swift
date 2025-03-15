// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "AIKit",
    platforms: [
        .macOS("12.0")
    ],
    products: [
        .library(
            name: "AIKit",
            targets: ["AIKit"])
    ],
    targets: [
        .target(
            name: "AIKit"),
        .testTarget(
            name: "AIKitTests",
            dependencies: ["AIKit"]
        ),
    ]
)
