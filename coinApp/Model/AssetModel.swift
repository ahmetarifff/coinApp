//
//  AssetModel.swift
//  coinApp
//
//  Created by Ahmet arif Yıldırım on 9.05.2023.
//

import Foundation

struct AssetModel: Codable{
    let id:String?
    let name:String?
    let symbol:String?
    let slugName:String?
    let status:String?
    let type:String?
    let url:String?
}


struct AssetsResponseModel: Codable {
    let content: [AssetModel]?
}
