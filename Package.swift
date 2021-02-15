// swift-tools-version:5.3
import PackageDescription

let versionTagString = "v3.0.215"
let checksum = "f5c966e94b6ab23d939ff8eecad88768b619d2f3ea5c5771e14427acf26d6caf"
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
