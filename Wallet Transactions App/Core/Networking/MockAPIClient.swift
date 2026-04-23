//
//  MockAPIClient.swift
//  Wallet Transactions App
//
//  Created by Hiren on 22/04/26.
//

import Foundation

final class MockAPIClient : APIClientProtocol {
   
    var shouldFail = false
    
    func request<T>(urlString: String, method:String = "GET") async throws -> T where T : Decodable {
        
        if shouldFail {
            throw APIError.requestFailed
        }
        
        let json : Data
        
        switch urlString {
            
        case "https://mock-api.com/wallet":
            json = """
            {
                "balance": 1250.75
            }
            """.data(using: .utf8)!
        case "https://mock-api.com/transactions":
            json = """
            [
                { "id": "1", "amount": 100.0, "status": "success" },
                { "id": "2", "amount": 50.0, "status": "pending" },
                { "id": "3", "amount": 75.5, "status": "failed" }
            ]
            """.data(using: .utf8)!

        default:
            throw APIError.invalidURL
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: json)
        } catch  {
            throw APIError.decodingFailed
        }
    }
    
    
    
    
}
