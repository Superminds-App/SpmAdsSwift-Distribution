# SpmAds (iOS) — gói phân phối v1.0.0

Repo này chỉ chứa `Package.swift` sinh tự động. Mã nguồn + test ở repo SpmAdsSwift (private).

## Cài đặt (Swift Package Manager)

Xcode → **File › Add Package Dependencies…** → `https://github.com/Superminds-App/SpmAdsSwift-Distribution` → *Exact Version* `1.0.0` →
chọn product **SpmAds** cho target app.

```swift
.package(url: "https://github.com/Superminds-App/SpmAdsSwift-Distribution", exact: "1.0.0")
// target: .product(name: "SpmAds", package: "SpmAdsSwift-Distribution")
```

```swift
import SpmAds
```

Một module duy nhất `SpmAds` (gộp core, UIKit, SwiftUI, tracking, billing). Bản source nhiều module
(`import SpmAdsCore` / `SpmAdsSwiftUI` / `SpmAdsTracking` / `SpmAdsBilling`) ⇒ đổi hết thành `import SpmAds`.
`SpmAds.NativeAd`/`SpmAds.NativeAdView` trùng tên với GoogleMobileAds: file import cả hai thì ghi rõ module.

## Binary

| | |
|---|---|
| File | `SpmAdsSDK-1.0.0.zip` (XCFramework **static**, ios-arm64 + simulator) |
| SHA256 | `3a724982d729ac43ab6e4a05a9787eea44755cf431198cf418184ac282b27074` |
| iOS tối thiểu | 15.0 |

## Dependency (SPM, khoảng version — không nhúng trong binary)

| Product | Package | Khoảng | Binary build với |
|---|---|---|---|
| `GoogleMobileAds` | https://github.com/googleads/swift-package-manager-google-mobile-ads.git | `13.13.0` ..< `14.0.0` | `13.13.0` |
| `GoogleUserMessagingPlatform` | https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git | `3.1.0` ..< `4.0.0` | `3.1.0` |
| `FirebaseAnalytics` | https://github.com/firebase/firebase-ios-sdk | `11.0.0` ..< `14.0.0` | `11.0.0` |
| `AdjustSdk` | https://github.com/adjust/ios_sdk | `5.0.0` ..< `6.0.0` | `5.0.0` |
| `FacebookCore` | https://github.com/facebook/facebook-ios-sdk | `17.0.0` ..< `20.0.0` | `17.0.0` |

App đã có một trong các SDK trên: version của app phải nằm trong khoảng (SPM chọn MỘT bản chung cho cả app).
Adapter mediation (AppLovin, Unity, Pangle, Meta…) app tự thêm — phải tương thích GoogleMobileAds ở trên.
Hướng dẫn tích hợp đầy đủ: `docs/INTEGRATION.md` của repo nguồn.
