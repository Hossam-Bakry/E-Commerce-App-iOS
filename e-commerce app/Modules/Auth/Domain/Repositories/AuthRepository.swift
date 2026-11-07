//
//  AuthRepository.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 04/11/2026.
//

import Foundation

protocol AuthRepository {
    
    func signIn(email: String, password: String) async -> ApiResult<Bool>
    func signUp(_ request: SignUpRequest) async -> ApiResult<Bool>
    
}
