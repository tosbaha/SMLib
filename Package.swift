// swift-tools-version:5.4
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
            path: "Source",
            exclude: ["Info-OSX.plist", "Info-iOS.plist", "Info-tvOS.plist", "Info-watchOS.plist", "SMLib.h"]
        ),
    ]
)
