// swift-tools-version: 5.8
import PackageDescription

let package = Package(
    name: "PackageName",
    dependencies: [
        .package(url: "https://github.com/sendbird/sendbird-chat-sdk-ios", .upToNextMinor(from: "4.9.5")),
        .package(url: "https://github.com/onevcat/Kingfisher", .upToNextMinor(from: "7.8.1")),
    ]
)