// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-mathkit",
    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .watchOS(.v11),
        .tvOS(.v17),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "MathKit", targets: ["MathKit"]),
        .library(name: "MathKitMetal", targets: ["MathKitMetal"]),

    ],
    dependencies: [
        .package(url: "https://github.com/vitali-kurlovich/Benchmarks", from: "0.1.6"),
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.7.0"),

    ],
    targets: {
        var targets: [Target] = [
            // Targets are the basic building blocks of a package, defining a module or a test suite.
            // Targets can depend on other targets in this package and products from dependencies.
            .target(
                name: "MathKit",
                dependencies: [
                ]
            ),

            .executableTarget(
                name: "MathKitBenchmarks",
                dependencies: [
                    "MathKit",
                    .product(name: "ArgumentParser", package: "swift-argument-parser"),
                    "Benchmarks",
                ],
                path: "Sources/Benchmarks"
            ),
            .testTarget(
                name: "MathKitTests",
                dependencies: [
                    "MathKit",
                ]
            ),
        ]

        #if os(macOS) || os(iOS) || os(watchOS) || os(tvOS)
            targets.append(
                .target(
                    name: "MathKitMetal",
                    dependencies: [
                        "MathKit",
                    ],
                    resources: [
                        .process("Metal/"),
                    ]
                )
            )
        #endif // os(macOS) || os(iOS) || os(watchOS) || os(tvOS)

        return targets
    }()
)
