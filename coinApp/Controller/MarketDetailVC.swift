//
//  MarketDetialVC.swift
//  coinApp
//
//  Created by Ahmet arif Yıldırım on 10.05.2023.
//

import UIKit

class MarketDetailVC: UIViewController {
    
    
    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var assetIdLbl: UILabel!
    @IBOutlet weak var quoteIdLbl: UILabel!
    
    // MARK: Propertıes
    var id: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMarketDetail()
    }
    
    
    private func getMarketDetail(){
        guard let id = id else {return}
        CoinsManagement.shred.getMarketById(id: id) {[weak self] errorString, response in
            guard let self = self else {return}
            
            if let errorString = errorString {
                print(errorString)
            }
            
            if let response = response {
                self.idLbl.text = response.id
                self.assetIdLbl.text = response.baseAssetId
                self.quoteIdLbl.text = response.quoteAssetId
            }
        }
    }
}
    
