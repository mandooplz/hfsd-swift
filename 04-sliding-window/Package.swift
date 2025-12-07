// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "04-sliding-window",
    platforms: [.macOS(.v15)],
    dependencies: [
        
    ],
    targets: [
        .target(
            name: "SlidingWindowData"
        ),
        .testTarget(
            name: "SlidingWindowTests",
            dependencies: ["SlidingWindowData"]
        )
    ]
)
