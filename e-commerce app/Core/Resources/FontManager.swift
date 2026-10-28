//
//  FontManager.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 25/10/2026.
//

import SwiftUI

enum FontSize {
    
    static let s12: CGFloat = 12
    static let s14: CGFloat = 14
    static let s16: CGFloat = 16
    static let s17: CGFloat = 17
    static let s18: CGFloat = 18
    static let s20: CGFloat = 20
    static let s22: CGFloat = 22
    static let s24: CGFloat = 24
    
}


enum AppFont {
    
    static let family = "Poppins"
    
    
    
    static func light(_ size: CGFloat = FontSize.s12) -> Font {popins(size,.light)}
    static func regular(_ size: CGFloat = FontSize.s12) -> Font {popins(size,.regular)}
    static func medium(_ size: CGFloat = FontSize.s12) -> Font {popins(size,.medium)}
    static func semiBold(_ size: CGFloat = FontSize.s12) -> Font {popins(size,.semibold)}
    static func bold(_ size: CGFloat = FontSize.s12) -> Font {popins(size,.bold)}
    
    
    
    private static func popins(_ size: CGFloat, _ weight: Font.Weight) -> Font {
        .custom(family, size: size).weight(weight)
    }
}
