import CoreGraphics

/// Flutter: `core/resources/values_manager.dart`.
///
/// No `.h` / `.w` / `.sp` here: SwiftUI already works in device-independent
/// points, so `flutter_screenutil` has no direct equivalent and isn't needed.
enum AppSize {
    static let s1: CGFloat = 1
    static let s2: CGFloat = 2
    static let s4: CGFloat = 4
    static let s8: CGFloat = 8
    static let s12: CGFloat = 12
    static let s15: CGFloat = 15
    static let s16: CGFloat = 16
    static let s18: CGFloat = 18
    static let s20: CGFloat = 20
    static let s24: CGFloat = 24
    static let s28: CGFloat = 28
    static let s40: CGFloat = 40
    static let s50: CGFloat = 50
    static let s55: CGFloat = 55
    static let s60: CGFloat = 60
    static let s100: CGFloat = 100
}

enum AppPadding {
    static let p4: CGFloat = 4
    static let p8: CGFloat = 8
    static let p12: CGFloat = 12
    static let p16: CGFloat = 16
    static let p18: CGFloat = 18
    static let p20: CGFloat = 20
}

enum AppMargin {
    static let m8: CGFloat = 8
    static let m12: CGFloat = 12
}
