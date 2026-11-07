//
//  SignInScreen.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 25/10/2026.
//

// Navigation

import SwiftUI

struct SignInScreen: View {
    
    @Environment(AppRouter.self) private var router
    
    @State private var email = ""
    @State private var password = ""
    @State private var emailError: String?
    @State private var passwordError: String?
    
    var body: some View {
       
        
        NavigationStack{
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
                        error: emailError,
                        keyboardType: .emailAddress,
                        contentType: .emailAddress,
                        
                    ).padding(.bottom, AppSize.s28)
                    
                    MainTextField(
                        label: "Password",
                        hint: "enter your password",
                        text: $password,
                        error: passwordError,
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
                        
                        NavigationLink("Create Account", destination: {
                            SignUpScreen()
                        })
                        .foregroundStyle(ColorManager.white)
                        
                        // need to open details screen

                        
                    }
                    .font(AppFont.semiBold(FontSize.s16))
                    .frame(maxWidth: .infinity)

                }
                .padding()
                
            }.background(ColorManager.primary)
        }
       
    }
    
    private func submit() {
        // you must validate before call api
        emailError = AppValidators.validateEmail(email)
        passwordError = AppValidators.validatePassword(password)
        
        guard emailError == nil, passwordError == nil else {return}
        
        print("Data complete to send")
        
        //calling api
    }
}

#Preview {
    return NavigationStack {
        SignInScreen()
    }
    
}
