//
//  WalletViewController.swift
//  Wallet Transactions App
//
//  Created by Hiren on 22/04/26.
//

import UIKit

class WalletViewController : UIViewController{
    
    @IBOutlet weak var balanceLabel: UILabel!
    
    @IBOutlet weak var errorLabel: UILabel!
    private let viewModel = WalletViewModel()
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    @IBOutlet weak var transactionBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        
        viewModel.fetchBalance()
    }
    
  
    private func bindViewModel(){
        viewModel.onUpdate = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async{
                self.balanceLabel.text = "Balance: ₹\(self.viewModel.balance)"
                self.errorLabel.text = self.viewModel.errorMessage
                
                if self.viewModel.isLoading {
                    self.loader.startAnimating()
                }
                else{
                    self.loader.isHidden = false
                    self.loader.stopAnimating()
                }
                
            }
        }
    }
    
    @IBAction func transactionButtonTapped(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        if let vc = storyboard.instantiateViewController(
            withIdentifier: "TransactionsViewController"
        ) as? TransactionsViewController{
            
            navigationController?.pushViewController(vc, animated: true)
    }
    }
    
}

//MARK: UI
extension WalletViewController {
    
    private func setupUI() -> Void {
        
        errorLabel.textColor = .red
        
    }
}
