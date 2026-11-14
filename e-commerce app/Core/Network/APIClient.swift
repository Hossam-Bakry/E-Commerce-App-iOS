//
//  APIClient.swift
//  e-commerce app
//
//  Created by Hossam Bakry on 08/11/2026.
//

import Foundation

// DIO --> webservice --> apiclient


final class APIClient {
    
    private let session: URLSession
    private let tokenStore: AuthTokenStore
    
    var onUnauthorized: (() -> Void)?
    
    private let decoder = JSONDecoder()
    private let encoder = JSONEncoder()
    
    
    init(tokenStore: AuthTokenStore) {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        
        self.session = URLSession(configuration: configuration)
        self.tokenStore = tokenStore
        
    }
    
    
    func request<Response: Decodable>(
        _ path: String,
        method: HTTPMethod = .get,
        pathParameters: [String: String] = [:],
        body: (any Encodable)? = nil
    ) async throws -> Response {
        
        let request = try buildRequest(path, method: method, pathParameters: pathParameters, body: body)
        
        let (data, resposne) = try await session.data(for: request)
        
        guard let http = resposne as? HTTPURLResponse else {
            throw ApiError.invalidResponse
        }
        
        guard (200..<300).contains(http.statusCode) else {
            if http.statusCode == 401 && path != EndPoints.signIn {
                handleUnauthorized()
            }
            throw ApiError.httpStatus(code: http.statusCode, data: data)
        }
        
        return try decoder.decode(Response.self, from: data)
    }
    
    // Return URLRequest
    private func buildRequest(
        _ path: String,
        method: HTTPMethod,
        pathParameters: [String: String],
        body: (any Encodable)?,
    ) throws -> URLRequest {
        
        var resolvedPath = path
        
        for(key, value) in pathParameters {
            resolvedPath = resolvedPath.replacingOccurrences(of: ":\(key)", with: value)
        }
        
        guard let url = URL(string: APIConstants.baseURL.appending(resolvedPath)) else {
            throw ApiError.invalidURL
        }

        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        /// request token
        ///
        
        /// AuthTokenService --> SharePrefrences 
        if let token = tokenStore.getToken() {
            request.setValue(token, forHTTPHeaderField: "token")
        }
        if let body {
            request.httpBody = try encoder.encode(body)
        }
        
        return request
    }
    
    private func handleUnauthorized() {
        tokenStore.clearToekn()
        onUnauthorized?()
    }
    
    
    
}
