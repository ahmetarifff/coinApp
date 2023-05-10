//
//  Cell.swift
//  coinApp
//
//  Created by Ahmet arif Yıldırım on 8.05.2023.

//

import Foundation

enum Cell: Int, CaseIterable {
    case ItemAssetsCell
    case ItemMarketCell

    var name: String {
        switch self {
        case .ItemAssetsCell:
            return "ItemAssetsCell"
        case .ItemMarketCell:
            return "ItemMarketCell"
        }
    }
    
    var reuseIdentifier: String {
        switch self {
        case .ItemAssetsCell:
            return "ItemAssetsCell"
        case .ItemMarketCell:
            return "ItemMarketCell"
        }
    }
}
