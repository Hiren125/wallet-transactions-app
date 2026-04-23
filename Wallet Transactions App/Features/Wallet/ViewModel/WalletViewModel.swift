//
//  WalletViewModel.swift
//  Wallet Transactions App
//
//  Created by Hiren on 22/04/26.
//

import Foundation

final class WalletViewModel {
    
    let apiClient : APIClientProtocol
    
    var isLoading = false
    
    var onUpdate : (() -> Void)?
    
    private(set) var balance : Double = 0.0
    private(set) var errorMessage : String?
    
    init(apiClient: APIClientProtocol = DIContainer.shared.apiClient) {
        self.apiClient = apiClient
    }
    
    func fetchBalance() {
        
        isLoading = true
        onUpdate?()
        
        Task{
            do {
                let response : WalletResponse = try await apiClient.request(urlString: "https://mock-api.com/wallet",method: "GET")
                
                balance = response.balance
                errorMessage = nil
                
            } catch {
                errorMessage = "Failed to load balance"
            }
            
            isLoading = false
            onUpdate?()
        }
        
       
    }
}
