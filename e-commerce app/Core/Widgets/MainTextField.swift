//
//  MainTextField.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 25/10/2026.
//


// State
// Binding
import SwiftUI

struct MainTextField: View {
    
    let label: String
    let hint: String
    
    @Binding var text: String
    var error: String?
    var isPassword: Bool = false
    var keyboardType: UIKeyboardType = .default
    var contentType: UITextContentType?
    
    
    
    @State private var isObscured: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppSize.s12){
            Text(label)
                .font(AppFont.medium(FontSize.s18))
                .foregroundStyle(ColorManager.white)
            HStack {
                
                Group{
                    if isPassword && !isObscured{
                        SecureField("", text: $text, prompt: prompt)
                            .keyboardType(keyboardType)
                    } else {
                        TextField("", text: $text,prompt: prompt)
                            .keyboardType(keyboardType)
                    }
                }
                    .textContentType(contentType)
                    .font(AppFont.regular(FontSize.s18))
                    .foregroundStyle(ColorManager.black)

                if isPassword {
                    Button{
                        isObscured.toggle()
                        
                    }label: {
                        Image(systemName: isObscured ? "eye" : "eye.slash")
                            .foregroundStyle(ColorManager.grey)
                    }
                }
                
                // Error Validation
                
                
            }
            .padding(.horizontal, AppSize.s16)
            .frame(height: AppSize.s55)
            .background(ColorManager.white, in: RoundedRectangle(cornerRadius: AppSize.s15))
            
            if let error {
                Text(error)
                    .font(AppFont.regular(FontSize.s12))
                    .foregroundStyle(ColorManager.error)
            }
                
        }
        
        
        
    }
    
    private var prompt: Text {
        Text(hint).foregroundStyle(ColorManager.grey).font(AppFont.regular(FontSize.s16))
    }
}


