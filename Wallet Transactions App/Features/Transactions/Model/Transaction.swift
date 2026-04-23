//
//  TransactionModel.swift
//  Wallet Transactions App
//
//  Created by Hiren on 22/04/26.
//

import Foundation

enum TransactionStatus : String,Decodable {
    case pending
    case success
    case failed
}


struct Transaction:Decodable,Identifiable {
    
    let id: String
    let amount : Double
    var status : TransactionStatus
}
