//
//  SignInScreen.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 25/10/2026.
//

import SwiftUI

struct SignInScreen: View {
    
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
       
        
        ScrollView{
            
            VStack (alignment: .leading, spacing: 0){
                
                Image(.routeLogo)
                    .resizable()
                    .foregroundStyle(ColorManager.white)
                    .frame(maxWidth: .infinity)
                    .scaledToFit()
                    .padding(.vertical, AppSize.s40)
                    .padding(.horizontal, AppSize.s40)
                
                Text("Welcome Back To Route")
                    .font(AppFont.semiBold(FontSize.s24)).foregroundStyle(ColorManager.white)
                Text("Please sign in with your mail")
                    .font(AppFont.light(FontSize.s16)).foregroundStyle(ColorManager.white)
                    .padding(.bottom, AppSize.s40)
                
                
                /// TextForm
                ///
                MainTextField(
                    label: "User Name",
                    hint: "enter your name",
                    text: $email,
                    keyboardType: .emailAddress,
                    contentType: .emailAddress,
                    
                ).padding(.bottom, AppSize.s28)
                
                MainTextField(
                    label: "Password",
                    hint: "enter your password",
                    text: $password,
                    isPassword: true
                ).padding(.bottom, AppSize.s12)
                
                HStack{
                    Spacer()
                    Button("Forget password?") {}
                        .font(AppFont.regular(FontSize.s18))
                        .foregroundStyle(ColorManager.white)
                }
                .padding(.bottom, AppSize.s60)
                
                
                CustomAppButton(label: "Login", action: submit, isEnable: true).padding(.bottom, AppSize.s28)
                
                HStack(alignment: .center, spacing: AppSize.s8){
                    
                    Text("Don't have an account?")
                        .font(AppFont.regular(FontSize.s18))
                        .foregroundStyle(ColorManager.white)
                    
                    
                    NavigationLink("Create Account") {SignUpScreen()}
                    
//                    Button("Create Account") {}
//                        .font(AppFont.regular(FontSize.s18))
//                        .foregroundStyle(ColorManager.white)
                    
                }
                .font(AppFont.semiBold(FontSize.s16))
                .frame(maxWidth: .infinity)

            }
            .padding()
            
        }.background(ColorManager.primary)
       
    }
    
    private func submit() {
        
    }
}

#Preview {
    SignInScreen()
}
