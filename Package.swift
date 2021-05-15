// swift-tools-version:5.3
import PackageDescription

let versionTagString = "v3.0.224"
let checksum = "a6d265e01c9189be1038d03ab9f686a832a3325b7eeab3d4cd280074f799a9f3"
let package = Package(
    name: "sendbird-ios-xcframework",
    platforms: [
        .iOS(.v9),
    ],
    products: [
        .library(
            name: "sendbird-ios-xcframework",
            targets: ["SendBirdSDK"])
    ],
    targets: [
        .binaryTarget(
            name: "SendBirdSDK",
            url: "https://github.com/ezhes/sendbird-ios-xcframework/releases/download/\(versionTagString)/SendBirdSDK.xcframework.zip",
            checksum: checksum
        )
    ]
)
