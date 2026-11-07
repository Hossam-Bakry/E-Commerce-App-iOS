//
//  AuthViewModel.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 04/11/2026.
//

import Foundation


@Observable
final class AuthViewModel {
    
    
    private let signInUseCase: SignInUseCase
    private let signUpUseCase: SignUpUseCase
    
    init(signInUseCase: SignInUseCase, signUpUseCase: SignUpUseCase) {
        self.signInUseCase = signInUseCase
        self.signUpUseCase = signUpUseCase
    }
    
    private func onSignIn(email: String, password: String) async {
        
    }
    
    private func onSignUp(_ request: SignUpRequest) {
        
    }
}
