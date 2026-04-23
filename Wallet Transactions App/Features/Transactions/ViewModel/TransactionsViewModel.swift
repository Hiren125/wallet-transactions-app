//
//  TransactionsViewModel.swift
//  Wallet Transactions App
//
//  Created by Hiren on 22/04/26.
//

import Foundation


final class TransactionsViewModel {
    
    private let apiClient : APIClientProtocol
    
    private(set) var transactions : [Transaction] = []
    private(set) var errorMessage : String?
    
    var onUpdate : (() -> Void)?
    
    init(apiClient : APIClientProtocol = DIContainer.shared.apiClient) {
        self.apiClient = apiClient
    }
    
    func fetchTransactions() async {
        do {
            let response : [Transaction] = try await apiClient.request(urlString: "", method: "GET")
            transactions = response
        } catch {
            errorMessage = "failed To load transaction"
        }
    }
    
    
    func loadMockTransactions() {
        transactions = [
                   Transaction(id: "1", amount: 100, status: .success),
                   Transaction(id: "2", amount: 50, status: .pending),
                   Transaction(id: "3", amount: 75, status: .failed)
               ]
               onUpdate?()
    }
    
    func processTransaction(id: String) {
        guard let index = transactions.firstIndex(where: { $0.id == id}) else { return }
        transactions[index].status = .pending
        updateStatus(id:id, status: .pending)
        
        Task{
            try? await Task.sleep(nanoseconds: 2_000_000)
            let success = Bool.random()
            let newStatus: TransactionStatus = success ? .success : .failed
            updateStatus(id:id, status: newStatus)
        }
    }
    
    func retryTransaction(id:String) {
        processTransaction(id: id)
    }
    
    private func updateStatus(id: String, status : TransactionStatus){
        guard let index = transactions.firstIndex(where: { $0.id == id }) else { return }
        
        DispatchQueue.main.async {
            self.transactions[index].status = status
            self.notify()
        }
    }
    private func notify(){
        onUpdate?()
    }
}
