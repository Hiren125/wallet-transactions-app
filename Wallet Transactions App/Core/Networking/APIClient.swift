//
//  APIClient.swift
//  Wallet Transactions App
//
//  Created by Hiren on 22/04/26.
//

import Foundation


final class APIClient : APIClientProtocol {
    
    func request<T:Decodable> (urlString:String, method:String = "GET") async throws -> T {
        
        //check URL
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
            
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        
        do {
            let (data,response) = try await URLSession.shared.data(for: request)
            
            guard let httpRequest = response as? HTTPURLResponse else { throw APIError.requestFailed }
            
            guard 200...209 ~= httpRequest.statusCode else { throw APIError.serverError(statusCode: httpRequest.statusCode)
            }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                return decoded
            }
            catch{
                throw APIError.decodingFailed
            }
            
        } catch {
            throw APIError.requestFailed
        }
    }
}
