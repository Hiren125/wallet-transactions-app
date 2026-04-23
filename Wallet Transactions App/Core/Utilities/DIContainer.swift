//
//  DIContainer.swift
//  Wallet Transactions App
//
//  Created by Hiren on 22/04/26.
//

import Foundation


final class DIContainer {
    
    static let shared = DIContainer()
    
    private init() {}
    
    //Toggle
    private let useMock = true
    
    lazy var apiClient : APIClientProtocol = {
        if useMock{
            return MockAPIClient()
        }
        return APIClient()
    }()
}
