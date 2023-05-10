//
//  MarketModel.swift
//  coinApp
//
//  Created by Ahmet arif Yıldırım on 9.05.2023.
//

import Foundation

struct MarketModel : Codable{
    let id : String?
    let baseAssetId : String?
    let quoteAssetId : String?

}

struct MarketResponseModel: Codable {
    let content: [MarketModel]?
}
