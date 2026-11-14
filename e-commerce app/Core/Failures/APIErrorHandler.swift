//
//  APIErrorHandler.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 08/11/2026.
//
import Foundation

enum APIErrorHandler {
    
    
    private struct ErrorBody: Decodable {
        
        let message: String?
    }
    
    static func handle(_ error: Error) -> ServerFailure {
        
        switch error {
            
            
        case let failure as ServerFailure:
            return failure
            
            
        case ApiError.httpStatus(let code, let data):
            let serverMessage = (try? JSONDecoder().decode(ErrorBody.self, from: data))?.message
            return ServerFailure(message: serverMessage ?? "An unexpected error occurred", statusCode: code)
            
            
            
        case let urlError as URLError:
            // No Internet, Timeout, DNS failure
            return ServerFailure(message: urlError.localizedDescription, statusCode: 0)
            
            
        case is DecodingError:
            return ServerFailure(message: "Unexpected response from the server", statusCode: 0)
            
            
        default:
            return ServerFailure(message: error.localizedDescription, statusCode: 0)
            
        
        }
        
        
    }
    
}
