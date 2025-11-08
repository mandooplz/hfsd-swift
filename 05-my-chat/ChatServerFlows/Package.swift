// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChatServerFlows",
    platforms: [.macOS(.v26), .iOS(.v26)],
    products: [
        // ChatServer의 Flow
        .library(
            name: "ChatServerFlows",
            targets: ["ChatServerFlows"]
        ),
    ],
    dependencies: [
        .package(path: "../MyChatValues"),
        .package(url: "https://github.com/team-budjam/swift-logger.git", from: "0.1.0")
    ],
    targets: [
        // ChatServer의 Flow
        .target(
            name: "ChatServerFlows",
            dependencies: [
                .product(name: "MyChatValues", package: "MyChatValues"),
                .product(name: "SwiftLogger", package: "swift-logger")
            ]
        ),
        
        // ChatServer의 Flow 테스트
        .testTarget(
            name: "ChatServerFlowsTests",
            dependencies: ["ChatServerFlows"]
        ),
    ]
)
