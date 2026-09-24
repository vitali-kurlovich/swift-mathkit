// swift-tools-version: 6.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

var targets: [Target] = [
    .target(
        name: "MathKit",
        dependencies: [
        ]
    ),

    .target(
        name: "MathKitUtils",
        dependencies: [
            "MathKit",
        ]
    ),

    .testTarget(
        name: "MathKitTests",
        dependencies: [
            "MathKit", "MathKitUtils",
        ]
    ),
]

#if os(anyAppleOS)

    targets.append(contentsOf: [
        .target(
            name: "CGMathKit",
            dependencies: [
                "MathKit",
            ]
        ),

        .testTarget(
            name: "CGMathKitTests",
            dependencies: [
                "CGMathKit", "MathKitUtils",
            ]
        ),

        .executableTarget(
            name: "MathKitBenchmarks",
            dependencies: [
                "MathKit", "CGMathKit",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "Benchmarks",
            ],
            path: "Benchmarks"
        ),

    ])

#elseif os(Linux)
    targets.append(
        .executableTarget(
            name: "MathKitBenchmarks",
            dependencies: [
                "MathKit",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                "Benchmarks",
            ],
            path: "Benchmarks"
        )
    )
#endif

let products: [Product]

#if os(anyAppleOS)
    products = [
        .library(name: "MathKit", targets: ["MathKit"]),
        .library(name: "CGMathKit", targets: ["CGMathKit"]),
    ]
#elseif os(Linux)
    products = [
        .library(name: "MathKit", targets: ["MathKit"]),
    ]
#endif

let package = Package(
    name: "swift-mathkit",
    platforms: [
        .macOS(.v14),
        .iOS(.v16),
        .watchOS(.v10),
        .tvOS(.v17),
    ],
    products: products,
    dependencies: [
        .package(url: "https://github.com/vitali-kurlovich/Benchmarks", from: "0.3.0"),
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.7.0"),
        .package(url: "https://github.com/swiftlang/swift-docc-plugin", from: "1.0.0"),
    ],
    targets: targets
)
