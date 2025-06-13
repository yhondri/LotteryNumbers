// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LotteryNumbers",
    platforms: [.macOS(.v12)],
    products: [
        .executable(
            name: "lotterynumbers", 
            targets: ["LotteryNumbersTool"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "1.5.1")
    ],
    targets: [
        .target(
            name: "LotteryNumbersCore",
            dependencies: []
        ),
        .executableTarget(
            name: "LotteryNumbersTool",
            dependencies: [
                "LotteryNumbersCore",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        ),
        .testTarget(
            name: "LotteryNumbersTests",
            dependencies: ["LotteryNumbersCore"]
        ),
    ]
)
