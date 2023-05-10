//
//  AssetListViewController.swift
//  coinApp
//
//  Created by Ahmet arif Yıldırım on 9.05.2023.
//

import Foundation
import UIKit

class AssetListViewController: UIViewController{
    
    // MARK: Subviews
    @IBOutlet var tableView: UITableView!
    
    // MARK: Properties
    private var assets = [AssetModel]() {didSet{tableView.reloadData()}}
    
    // MARK: Viewcycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        configureSubviews()
        getAssets()
    }
    
    // MARK: Helpers
    private func configureSubviews(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: Cell.ItemAssetsCell.name, bundle: nil), forCellReuseIdentifier: Cell.ItemAssetsCell.reuseIdentifier)
    }
    
    // MARK: API
    private func getAssets(){
        CoinsManagement.shred.getAssets {[weak self] errorString, response in
            guard let self = self else {return}
            
            if let errorString = errorString {
                print(errorString)
            }
            
            if let response = response?.content {
                self.assets = response
            }
        }
    }
}

// MARK: UITableViewDelegate & UITableViewDataSource
extension AssetListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        assets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Cell.ItemAssetsCell.reuseIdentifier) as? ItemAssetsCell {
            cell.model = assets[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("DEBUG: hihihi")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyboard.instantiateViewController(withIdentifier: "AssetDetailsVC") as? AssetDetailsVC {
            viewController.id = assets[indexPath.row].id
            viewController.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
