//
//  SignUpRegest.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 04/11/2026.
//

import Foundation


/// toJosn
struct SignUpRequest: Encodable {
    
    let name: String
    let email: String
    let password: String
    let phone: String
    
    
    private enum CodingKeys: String, CodingKey {
        case name, email, password, rePassword, phone
        
    }
    
    func encode(to encoder: Encoder) throws {
        var conatiner = encoder.container(keyedBy: CodingKeys.self)
        
        try conatiner.encode(name, forKey: .name)
        try conatiner.encode(email, forKey: .email)
        try conatiner.encode(password, forKey: .password)
        try conatiner.encode(password, forKey: .rePassword)
        try conatiner.encode(phone, forKey: .phone)
    }
}
