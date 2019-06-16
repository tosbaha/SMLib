// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "SMLib",
    products: [
        .library(
            name: "SMLib",
            targets: ["SMLib"]
        )
    ],
    targets: [
        .target(
            name: "SMLib",
            dependencies: [],
            path: ".",
            sources: ["Source"]
        ),
    ]
)
