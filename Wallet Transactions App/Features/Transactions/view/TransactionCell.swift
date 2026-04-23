//
//  TransactionCell.swift
//  Wallet Transactions App
//
//  Created by Hiren on 22/04/26.
//

import UIKit

class TransactionCell: UITableViewCell {
    
    @IBOutlet weak var amountLabel: UILabel!
    
    @IBOutlet weak var statusLabel: UILabel!
   

    @IBOutlet weak var retryPaymentButton: UIButton!
    
    static let identifier = "TransactionCell"
    
    var onRetry: (() -> Void)?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup(){
        retryPaymentButton.addTarget(self, action: #selector(retryButtonTapped), for: .touchUpInside)
    }

    
    
    func configure(with transactions: Transaction) {
        amountLabel.text = "Spent  \(transactions.amount)"
        statusLabel.text = transactions.status.rawValue.capitalized
        
        switch transactions.status {
        case .failed:
            retryPaymentButton.isHidden = false
        default:
            retryPaymentButton.isHidden = true
        }
    }
    
    @objc private func retryButtonTapped() {
        onRetry?()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
