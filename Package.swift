// swift-tools-version:5.3
import PackageDescription

let versionTagString = "v3.0.229"
let checksum = "645adf7c44a494ce4cdfa3a3b4865c42dc78a698c5187d87fba4288887a49b7a"
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
