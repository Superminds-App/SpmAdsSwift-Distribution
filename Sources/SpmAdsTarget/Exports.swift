// Wrapper: kéo binary SpmAds + dependency SPM (GMA, UMP, Firebase, Adjust, FBSDK) vào app.
// App viết `import SpmAds`. KHÔNG re-export GoogleMobileAds để tránh trùng tên
// (`NativeAd`, `NativeAdView`…) — file nào cần GMA thì tự `import GoogleMobileAds`.
@_exported import SpmAds
