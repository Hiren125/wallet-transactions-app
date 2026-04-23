//
//  APIError.swift
//  Wallet Transactions App
//
//  Created by Hiren on 22/04/26.
//

import Foundation

enum APIError : Error {
    case invalidURL
    case requestFailed
    case decodingFailed
    case serverError(statusCode : Int)
}
