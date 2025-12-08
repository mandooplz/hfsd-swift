// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Solver",
    platforms: [.macOS(.v15)],
    products: [
        .library(
            name: "Solver",
            targets: ["Solver"]
        ),
        .library(
            name: "Values",
            targets: ["Values"]
        )
    ],
    targets: [
        // MARK: Solver
        .target(
            name: "Solver"
        ),
        .testTarget(
            name: "SolverTests",
            dependencies: ["Solver"]
        ),
        
        // MARK: Values
        .target(
            name: "Values",
            dependencies: ["Solver"]
        ),
        .testTarget(
            name: "ValueTests",
            dependencies: ["Values"]
        ),
    ]
)
