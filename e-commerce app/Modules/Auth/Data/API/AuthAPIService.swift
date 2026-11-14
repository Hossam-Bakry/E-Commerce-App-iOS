//
//  AuthAPIService.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 08/11/2026.
//

import Foundation

protocol AuthAPIService {
    func signIn(_ body: SignInRequest) async throws -> SignInResponse
    
    func signUp(_ body: SignUpRequest) async throws -> SignInResponse
}


final class AuthAPIServiceImp: AuthAPIService {
    
    private let client: APIClient
    
    
    init(client: APIClient) {
        self.client = client
    }
    
    func signIn(_ body: SignInRequest) async throws -> SignInResponse {
        try await client.request(EndPoints.signIn, method: .post, body: body)
    }
    
    func signUp(_ body: SignUpRequest) async throws -> SignInResponse {
        try await client.request(EndPoints.signUp, method: .post, body: body)
    }
    
}
