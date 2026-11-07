//
//  SignUpUseCase.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 04/11/2026.
//

import Foundation

/// OOP
final class SignUpUseCase {
    
    // 1-
    private let repository: AuthRepository
    
    init(repository: AuthRepository) {
        self.repository = repository
    }
    
    func execute(_ request: SignUpRequest) async -> ApiResult<Bool>
    
    {
        await repository.signUp(request)
    }
}
