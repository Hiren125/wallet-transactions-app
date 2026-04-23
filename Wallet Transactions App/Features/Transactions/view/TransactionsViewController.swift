//
//  TransactionsViewController.swift
//  Wallet Transactions App
//
//  Created by Hiren on 22/04/26.
//

import UIKit

class TransactionsViewController: UIViewController {

    private let viewModel = TransactionsViewModel()

    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Transactions"
        setupTable()
        bindViewModel()
        viewModel.loadMockTransactions()
    }
    
    
    private func setupTable() {
        
        let nib = UINib(nibName: "TransactionCell", bundle: nil)
        tableview.register(nib, forCellReuseIdentifier: TransactionCell.identifier)
        
        tableview.dataSource = self
        tableview.delegate = self
    }
    
    private func bindViewModel() {
            viewModel.onUpdate = { [weak self] in
                DispatchQueue.main.async {
                    self?.tableview.reloadData()
                }
            }
        }

}


extension TransactionsViewController : UITableViewDataSource,UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.transactions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let tx = viewModel.transactions[indexPath.row]
        
        let cell = tableview.dequeueReusableCell(
            withIdentifier: TransactionCell.identifier,
            for: indexPath
        ) as! TransactionCell
        
        cell.configure(with: tx)
        
        cell.onRetry = { [weak self] in
            self?.viewModel.retryTransaction(id: tx.id)
        }
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
}
