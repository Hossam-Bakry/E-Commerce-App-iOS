//
//  AuthDataSource.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 08/11/2026.
//

import Foundation

protocol AuthDataSource {
    
    func signIn(email: String, password: String) async throws -> SignInResponse
    func signUp(_ request: SignUpRequest) async throws -> SignInResponse
    
}


final class RemoteAuthDataSource: AuthDataSource {
    
    private let apiService: AuthAPIService
    
    init(apiService: AuthAPIService) {
        self.apiService = apiService
    }
    
    func signIn(email: String, password: String) async throws -> SignInResponse {
        try await apiService.signIn(SignInRequest(email: email, password: password))
    }
    
    func signUp(_ request: SignUpRequest) async throws -> SignInResponse {
        try await apiService.signUp(request)
    }
}
