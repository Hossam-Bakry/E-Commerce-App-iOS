//
//  Validator.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 01/11/2026.
//

import Foundation

enum AppValidators {
    static func validateEmail(_ value: String) -> String? {
        let pattern = #"^[a-zA-Z0-9.!#$%&'*+\-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"#
        if value.trimmingCharacters(in: .whitespaces).isEmpty { return "this field is required" }
        if value.range(of: pattern, options: .regularExpression) == nil { return "enter valid email" }
        return nil
    }

    static func validatePassword(_ value: String) -> String? {
        if value.isEmpty { return "this field is required" }
        let hasLetter = value.range(of: "[a-zA-Z]", options: .regularExpression) != nil
        let hasDigit = value.range(of: "[0-9]", options: .regularExpression) != nil
        if value.count < 8 || !hasLetter || !hasDigit { return "strong password please" }
        return nil
    }

    static func validateConfirmPassword(_ value: String, password: String) -> String? {
        if value.isEmpty { return "this field is required" }
        if value != password { return "same password" }
        return nil
    }

    static func validateFullName(_ value: String) -> String? {
        value.isEmpty ? "this field is required" : nil
    }

    static func validatePhoneNumber(_ value: String) -> String? {
        let trimmed = value.trimmingCharacters(in: .whitespaces)
        if trimmed.isEmpty { return "this field is required" }
        if Int(trimmed) == nil { return "enter numbers only" }
        if trimmed.count != 11 { return "enter value must equal 11 digit" }
        return nil
    }
}
