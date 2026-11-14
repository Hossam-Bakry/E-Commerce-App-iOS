//
//  SignUpScreen.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 25/10/2026.
//


// @State
// @Binding

import SwiftUI

struct SignUpScreen: View {
    
    // immutable vs mutable
    // property wrapper
    // @State @Binding @ObservableObject @Enviromnet
    
    @State private var name = ""
    @State private var email = ""
    @State private var phone = ""
    @State private var password = ""
    
    @State private var nameError: String?
    @State private var emailError: String?
    @State private var phoneError: String?
    @State private var passwordError: String?
    
    @State private var viewModel = ServiceLocator.shared.resolve(AuthViewModel.self)
    
    var body: some View {
       
        ScrollView {
            
            VStack(alignment: .leading, spacing: 0) {
                Image(.routeLogo)
                    .resizable()
                    .foregroundStyle(ColorManager.white)
                    .frame(maxWidth: .infinity)
                    .scaledToFit()
                    .padding(.vertical, AppSize.s40)
                    .padding(.horizontal, AppSize.s40)
                
                Text("Create your account")
                    .font(AppFont.bold(FontSize.s24))
                    .foregroundStyle(ColorManager.white)
                    
                Text("Please fill in the details below")
                    .font(AppFont.bold(FontSize.s24))
                    .foregroundStyle(ColorManager.white)
                    .padding(.bottom, AppSize.s50)
                
                VStack(spacing: AppSize.s18) {
                    MainTextField(label: "Full Name", hint: "enter your full name", text: $name, error: nameError)
                    
                    MainTextField(label: "Mobile Number", hint: "enter your mobile number", text: $phone,
                    error: phoneError)
                    
                    MainTextField(label: "E-mail", hint: "enter your email", text: $email, error: emailError)

                    MainTextField(label: "Password", hint: "enter your password", text: $password, error: passwordError)
                }.padding(.bottom, AppSize.s50)
                
                CustomAppButton(label: "Sign Up", action: submit)
                    .padding(.bottom, AppSize.s28)
                
                HStack{
                    
                }
            }.padding(AppSize.s20)
            
        }
        .background(ColorManager.primary)
        
    }
    private func submit() {
        
        nameError = AppValidators.validateFullName(name)
        phoneError = AppValidators.validatePhoneNumber(phone)
        emailError = AppValidators.validateEmail(email)
        passwordError = AppValidators.validatePassword(password)
        
        guard [nameError, phoneError, emailError, passwordError].allSatisfy({$0 == nil}) else { return }
        
        viewModel.send(.signUp(SignUpRequest(name: name, email: email, password: password, phone: phone)))
    }
    
}

#Preview {
    SignUpScreen()
}
