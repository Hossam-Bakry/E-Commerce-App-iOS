//
//  User.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 08/11/2026.
//

import Foundation

struct User: Codable, Hashable {
    
    let name: String?
    let email: String?
    let role: String?
    let phone: String?
}
