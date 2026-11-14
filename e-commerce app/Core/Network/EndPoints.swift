//
//  EndPoints.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 08/11/2026.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum EndPoints {
    static let signIn = "/api/v1/auth/signin"
    static let signUp = "/api/v1/auth/signup"
}
