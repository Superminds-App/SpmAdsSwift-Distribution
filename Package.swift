// swift-tools-version: 5.9
// SINH TỰ ĐỘNG bởi SpmAdsSwift/scripts/build-xcframeworks.sh — SpmAds v1.0.1. Không sửa tay.
//
// - Binary `SpmAds` = XCFramework STATIC, một module gộp (SpmAdsCore/SpmAds/SpmAdsSwiftUI/
//   SpmAdsTracking/SpmAdsBilling). App chỉ cần `import SpmAds`.
// - GoogleMobileAds, UMP, Firebase, Adjust, FBSDK KHÔNG nhúng trong binary: khai ở đây theo KHOẢNG
//   version (binary build với CẬN DƯỚI) để app + adapter mediation dùng chung MỘT bản GMA, và app đã có
//   Firebase/Adjust/FBSDK resolve chung được.
import PackageDescription

let package = Package(
    name: "SpmAds",
    platforms: [
        .iOS(.v15),
    ],
    products: [
        .library(name: "SpmAds", targets: ["SpmAdsTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", "13.13.0"..<"14.0.0"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git", "3.1.0"..<"4.0.0"),
        .package(url: "https://github.com/firebase/firebase-ios-sdk", "11.0.0"..<"14.0.0"),
        .package(url: "https://github.com/adjust/ios_sdk", "5.0.0"..<"6.0.0"),
        .package(url: "https://github.com/facebook/facebook-ios-sdk", "17.0.0"..<"20.0.0"),
    ],
    targets: [
        .binaryTarget(
            name: "SpmAds",
            url: "https://github.com/Superminds-App/SpmAdsSwift-Distribution/releases/download/1.0.1/SpmAdsSDK-1.0.1.zip",
            checksum: "1d10249624581626cb880ae12e7492ffb1456bcb213ef9a735c9f7c72b4c7d92"
        ),
        .target(
            name: "SpmAdsTarget",
            dependencies: [
                "SpmAds",
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                .product(name: "GoogleUserMessagingPlatform", package: "swift-package-manager-google-user-messaging-platform"),
                .product(name: "FirebaseAnalytics", package: "firebase-ios-sdk"),
                .product(name: "AdjustSdk", package: "ios_sdk"),
                .product(name: "FacebookCore", package: "facebook-ios-sdk"),
            ],
            path: "Sources/SpmAdsTarget"
        ),
    ]
)
