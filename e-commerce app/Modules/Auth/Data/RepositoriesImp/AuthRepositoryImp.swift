//
//  AuthRepositoryImp.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 08/11/2026.
//


import Foundation

final class AuthRepositoryImp: AuthRepository {
    
    private let dataSource: AuthDataSource
    private let tokenStore: AuthTokenStore
    
    init(dataSource: AuthDataSource, tokenStore: AuthTokenStore) {
        self.dataSource = dataSource
        self.tokenStore = tokenStore
    }
    
    func signIn(email: String, password: String) async -> ApiResult<Bool> {
        do {
            let response = try await dataSource.signIn(email: email, password: password)
            
            guard let token = response.token, !token.isEmpty else {
                return .failure(ServerFailure(message: "SignInSuccess but no token", statusCode: 0))
            }
            
            
            tokenStore.save(token)
            return .success(true)
        } catch {
            return .failure(APIErrorHandler.handle(error))
        }
    }
    
    func signUp(_ request: SignUpRequest) async -> ApiResult<Bool> {
        do {
            
            _ = try await dataSource.signUp(request)
            return .success(true)
            
            
        } catch {
            return .failure(APIErrorHandler.handle(error))
        }
    }
    
    
}
