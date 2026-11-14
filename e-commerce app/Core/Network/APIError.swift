//
//  ApiError.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 08/11/2026.
//
import Foundation


enum ApiError: Error {
    
    case httpStatus(code: Int, data: Data)
    case invalidResponse
    case invalidURL
    
}
