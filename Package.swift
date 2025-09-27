// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "KVLoading",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
    ],
    products: [
        .library(
            name: "KVLoading",
            targets: ["KVLoading"],
        ),
    ],
    targets: [
        .target(
            name: "KVLoading",
            path: "KVLoading/Classes",
        ),
    ]
)
