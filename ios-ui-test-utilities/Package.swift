// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UITestUtilities",
    products: [
        .library(name: "UITestUtilitiesApp", targets: ["UITestUtilitiesApp"]),
        .library(name: "UITestUtilities", targets: ["UITestUtilities"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "UITestUtilitiesApp",
            dependencies: []),
        .target(
            name: "UITestUtilities",
            dependencies: ["UITestUtilitiesApp"])
    ]
)
