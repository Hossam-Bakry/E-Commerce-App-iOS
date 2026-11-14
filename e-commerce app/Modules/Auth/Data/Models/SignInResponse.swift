//
//  SignInResponse.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 08/11/2026.
//

import Foundation


struct SignInResponse: Decodable {
    
    let message: String?
    let user: User?
    let token: String?
}



