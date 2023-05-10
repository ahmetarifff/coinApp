//
//  MarketListViewController.swift
//  coinApp
//
//  Created by Ahmet arif Yıldırım on 9.05.2023.
//

import Foundation
import UIKit

class MarketListViewController:UIViewController{
    
    
    @IBOutlet weak var marketTableView: UITableView!
    @IBOutlet weak var progressBar: UIActivityIndicatorView!
    
    // MARK: Properties
    private var assets = [MarketModel]() {didSet{marketTableView.reloadData()}}
    
    
    // MARK: Viewcycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.progressBar.startAnimating()
        configureSubviews()
        getMarketApi()
    }
    
    
    // MARK: Helpers
    private func configureSubviews(){
        marketTableView.dataSource = self
        marketTableView.delegate = self
        marketTableView.register(UINib(nibName: Cell.ItemMarketCell.name, bundle: nil), forCellReuseIdentifier: Cell.ItemMarketCell.reuseIdentifier)
    }
    
    // MARK: API
    private func getMarketApi(){
        CoinsManagement.shred.getMarket {[weak self] errorString, response in
            guard let self = self else {return}
            if let errorString = errorString {
                print(errorString)
            }
        
            if let response = response?.content {
                self.progressBar.stopAnimating()
                self.progressBar.isHidden = true
                self.assets = response
            }
        }
    }
   
}


// MARK: UITableViewDelegate & UITableViewDataSource
extension MarketListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        assets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Cell.ItemMarketCell.reuseIdentifier) as? ItemMarketCell {
            cell.model = assets[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "MarketDetailVC") as? MarketDetailVC {
            viewController.id = assets[indexPath.row].id
            viewController.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
