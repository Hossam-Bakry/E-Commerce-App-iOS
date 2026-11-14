//
//  ServerFailure.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 08/11/2026.
//

struct ServerFailure: Error, Equatable {
    
    let message: String
    let statusCode: Int
    
}
