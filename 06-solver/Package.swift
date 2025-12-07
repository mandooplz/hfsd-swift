// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Solver",
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
        .target(
            name: "Solver"
        ),
        .testTarget(
            name: "SolverTests",
            dependencies: ["Solver"]
        ),
        .target(
            name: "Values"
        ),
        .testTarget(
            name: "ValueTests",
            dependencies: ["Values"]
        ),
    ]
)
