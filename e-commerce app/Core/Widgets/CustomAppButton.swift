//
//  CustomAppButton.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 25/10/2026.
//

import SwiftUI

struct CustomAppButton: View {
    
    
    let label: String
    let action: () -> Void
    
    var forgroundColor = ColorManager.primary
    var backgroundColor = ColorManager.white
    var font = AppFont.bold(FontSize.s18)
    var isEnable: Bool = true
    
    var body: some View {
        Button(action: action){
            Text(label)
                .font(font)
                .foregroundStyle(forgroundColor)
                .frame(maxWidth: .infinity)
                .frame(height: AppSize.s55)
                .background(backgroundColor, in: RoundedRectangle(cornerRadius: AppSize.s15))
                
        }
        .buttonStyle(.plain)
        .disabled(!isEnable)
        .opacity(isEnable ? 1 : 0.6)
    }
}
