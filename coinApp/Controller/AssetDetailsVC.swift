//
//  AssetDetailsVC.swift
//  coinApp
//
//  Created by Ahmet arif Yıldırım on 9.05.2023.
//

import UIKit

class AssetDetailsVC: UIViewController {
    
    // MARK: Subviews
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    
    
    // MARK: Propertıes
    var id: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAssetDetail()
        
        // Do any additional setup after loading the view.
    }
    
    
    private func getAssetDetail(){
        guard let id = id else {return}
        CoinsManagement.shred.getAssets(id: id) {[weak self] errorString, response in
            guard let self = self else {return}
            
            if let errorString = errorString {
                print(errorString)
            }
            
            if let response = response {
                self.idLabel.text = response.id
                self.nameLabel.text = response.name
                self.symbolLabel.text = response.symbol
                self.urlLabel.text = response.url
                self.typeLabel.text = response.type
            }
        }
    }
    
    
}
