//
//  APIClientProtocol.swift
//  Wallet Transactions App
//
//  Created by Hiren on 22/04/26.
//

import Foundation


protocol APIClientProtocol {
    
    func request<T:Decodable> (urlString:String, method:String) async throws -> T
    
}

extension APIClientProtocol {
    
    func request<T:Decodable> (urlString:String, method:String) async throws -> T {
        return try await request(urlString: urlString, method: "GET")
    }
}
