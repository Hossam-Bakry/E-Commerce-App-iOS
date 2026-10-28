//
//  ColorManager.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 25/10/2026.
//

import SwiftUI

enum ColorManager{

    static let primary = Color(hex: 0x004182)
    static let appBarTitleColor = Color(hex: 0x06004F)
    static let primaryDark = Color(hex: 0x06004F)
    
    static let grey = Color(hex: 0x737477)
    static let lightGrey = Color(hex: 0x9E9E9E)
    static let black = Color(hex: 0x000000)
    static let containerGray = Color(hex: 0xDBE4ED)
    static let transparent = Color.clear

    static let starRateColor = Color(hex: 0xFDD835)
    static let textColor = Color(hex: 0x06004F)
    static let darkBlue = Color(hex: 0x06004F)
    static let yellow = Color(hex: 0xFDD835)

    static let darkPrimary = Color(hex: 0xD17D11)
    static let lightPrimary = Color(hex: 0xD17D11).opacity(0.8)
    static let grey1 = Color(hex: 0x707070)
    static let grey2 = Color(hex: 0x797979)
    static let white = Color(hex: 0xFFFFFF)
    static let error = Color(hex: 0xE61F34)
    
}


extension Color {
    
    /// Color(hex: 0x004182)
    /// overloading
    
    init(hex: UInt32, opacity: Double = 1.0) {
        
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255,
            opacity: opacity
        )
    }
    
}
