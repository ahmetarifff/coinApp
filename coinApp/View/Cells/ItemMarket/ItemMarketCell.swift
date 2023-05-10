//
//  ItemMarketCell.swift
//  coinApp
//
//  Created by Ahmet arif Yıldırım on 10.05.2023.
//

import UIKit

class ItemMarketCell: UITableViewCell {
    
  

    @IBOutlet weak var idLbl: UILabel!
    @IBOutlet weak var assetIdLbl: UILabel!
    @IBOutlet weak var quoteIdLbl: UILabel!
    
    
    // MARK: Properties
    var model: MarketModel? {didSet{configureCell()}}
    // MARK: Init
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: Helpers
    private func configureCell(){
        guard let model = model else {return}
        idLbl.text = model.id
        quoteIdLbl.text = model.quoteAssetId
        assetIdLbl.text = model.baseAssetId
    }

    
}
