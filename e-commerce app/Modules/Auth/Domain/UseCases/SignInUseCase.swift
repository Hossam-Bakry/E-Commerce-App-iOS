//
//  SignInUseCase.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 04/11/2026.
//

import Foundation


final class SignInUseCase {
    
    
    private let repository: AuthRepository
    
    init(repository: AuthRepository) {
        self.repository = repository
    }
    
    
    func execute(email: String, password: String) async -> ApiResult<Bool>
    {
        await repository.signIn(email: email, password: password)
    }
    
    
    
}
