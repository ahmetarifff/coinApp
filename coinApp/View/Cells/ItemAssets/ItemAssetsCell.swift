//
//  ItemAssetsCell.swift
//  coinApp
//
//  Created by Ahmet arif Yıldırım on 8.05.2023.

//

import UIKit

class ItemAssetsCell: UITableViewCell {
    
    // MARK: Subviews
    @IBOutlet weak var symbolLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    
    // MARK: Properties
    var model: AssetModel? {didSet{configureCell()}}
    // MARK: Init
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: Helpers
    private func configureCell(){
        guard let model = model else {return}
        symbolLbl.text = model.symbol
        nameLbl.text = model.name
        typeLbl.text = model.type
    }
    
}
