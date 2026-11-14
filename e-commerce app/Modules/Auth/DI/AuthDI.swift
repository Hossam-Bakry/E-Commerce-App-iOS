//
//  AuthDI.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 08/11/2026.
//

import Foundation


enum AuthDI {
    static func setup(_ locator: ServiceLocator) {
        
        
        // 1- AuthAPIService
        // 2- AuthDataSource
        // 3- AuthRepository
       
        // 4- SignInUseCase
        // 5- SignUpUseCase
        // 6- AuthViewModel
        
        
        locator.registerLazySingleton(AuthAPIService.self) {
            AuthAPIServiceImp(client: locator.resolve(APIClient.self))
        }
        
        locator.registerLazySingleton(AuthDataSource.self) {
            RemoteAuthDataSource(apiService: locator.resolve(AuthAPIService.self))
        }
        
        locator.registerLazySingleton(AuthRepository.self) {
            AuthRepositoryImp(
                dataSource: locator.resolve(AuthDataSource.self),
                tokenStore: locator.resolve(AuthTokenStore.self),
            )
        }
        
        locator.registerLazySingleton(SignInUseCase.self) {
            SignInUseCase(repository: locator.resolve(AuthRepository.self))
        }
        
        locator.registerLazySingleton(SignUpUseCase.self) {
            SignUpUseCase(repository: locator.resolve(AuthRepository.self))
        }
        
        locator.registerFactory(AuthViewModel.self){
            AuthViewModel(
                signInUseCase: locator.resolve(SignInUseCase.self),
                signUpUseCase: locator.resolve(SignUpUseCase.self),
            )
        }
        
        

        
        
    }
}
