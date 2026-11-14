//
//  AuthViewModel.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 04/11/2026.
//

import Foundation


enum AuthEvent {

    case signIn(email: String, password: String)
    case signUp(SignUpRequest)
    
}


enum AuthState: Equatable {
    
    case initial
    case loading
    case success
    case error(String)
    
}

@Observable
final class AuthViewModel {
    
    private(set) var state: AuthState = .initial
    
    
    private let signInUseCase: SignInUseCase
    private let signUpUseCase: SignUpUseCase
    
    init(signInUseCase: SignInUseCase, signUpUseCase: SignUpUseCase) {
        self.signInUseCase = signInUseCase
        self.signUpUseCase = signUpUseCase
    }
    
    
    func send(_ event: AuthEvent) {
        
        Task {
            switch event {
            case .signIn(let email, let password):
                await onSignIn(email: email, password: password)
                
            case .signUp(let request):
                await onSignUp(request)
            }
        }
    }
    
    
    // Clean Arch
    // viewModel --> UseCase --> Repository [Imp] --> DataSource
    private func onSignIn(email: String, password: String) async {
     
        state = .loading
        let result = await signInUseCase.execute(email: email, password: password)
        
        switch result {
            
        case .success:
            state = .success
            
        case .failure(let failure):
            state = .error(failure.message)
            
        }
        
    }
    
    private func onSignUp(_ request: SignUpRequest) async {
        
        state = .loading
        
        let result = await signUpUseCase.execute(request)
        
        switch result {
            
        case .success:
            state = .success
            
        case .failure(let failure):
            state = .error(failure.message)
            
        }
        
        
    }
}
