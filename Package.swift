// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "KVLoading",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "KVLoading",
            targets: ["KVLoading"]
        ),
    ],
    targets: [
        .target(
            name: "KVLoading",
            path: "KVLoading/Classes"
        ),
    ]
)
