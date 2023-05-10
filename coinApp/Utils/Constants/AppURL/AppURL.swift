//
//  AppURL.swift
//  coinApp
//
//   Created by Ahmet arif Yıldırım on 8.05.2023.

//

import Foundation

struct AppURL {
    private struct Domains {
        static let Dev = "https://bravenewcoin.p.rapidapi.com"
    }
    
    private  static let Domain = Domains.Dev

    private  static let BaseURL = Domain
    
    static var assets: String {
        return BaseURL + "/asset"
    }
    
    static var market: String{
        return BaseURL + "/market"
    }
    
    static var assetsById: String {
        return BaseURL + "/asset"
    }
    
    static var marketById: String {
        return BaseURL + "/market"
    }
}
