//
//  CoinsManagement.swift
//  coinApp
//
//  Created by Ahmet arif Yıldırım on 8.05.2023.

//

import Foundation
import Alamofire

struct CoinsManagement {
    static let shred = CoinsManagement()
    
    
    //Asset List
    func getAssets(completion: @escaping (String?, AssetsResponseModel?) -> Void) {
        let stringUrl = AppURL.assets
        let authKey = Token.key
        let _headers : HTTPHeaders = ["X-RapidAPI-Key": "\(authKey)",
                                      "X-RapidAPI-Host": "bravenewcoin.p.rapidapi.com"]
        
        if let url = URL(string: stringUrl) {
            AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: _headers).responseData { response in
                debugPrint(response)
                switch response.result {
                case .success(let data):
                    print(String(describing: String(data: data, encoding: .utf8)))
                    do {
                        let asJSON = try JSONDecoder().decode(AssetsResponseModel.self, from: data)
                        completion(nil, asJSON)
                    } catch {
                        print("Error while decoding response: " + String(describing: error) + " from: \(String(describing: String(data: data, encoding: .utf8)))")
                        completion(error.localizedDescription, nil)
                    }
                case .failure(let error):
                    print("failure \(error)")
                    completion(error.localizedDescription, nil)
                }
            }
        }
    }
    
    //Market List
    func getMarket(completion: @escaping (String?, MarketResponseModel?) -> Void) {
        let stringUrl = AppURL.market
        let authKey = Token.key
        let _headers : HTTPHeaders = ["X-RapidAPI-Key": "\(authKey)",
                                      "X-RapidAPI-Host": "bravenewcoin.p.rapidapi.com"]
        
        if let url = URL(string: stringUrl) {
            AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: _headers).responseData { response in
                debugPrint(response)
                switch response.result {
                case .success(let data):
                    print(String(describing: String(data: data, encoding: .utf8)))
                    do {
                        let asJSON = try JSONDecoder().decode(MarketResponseModel.self, from: data)
                        completion(nil, asJSON)
                    } catch {
                        print("Error while decoding response: " + String(describing: error) + " from: \(String(describing: String(data: data, encoding: .utf8)))")
                        completion(error.localizedDescription, nil)
                    }
                case .failure(let error):
                    print("failure \(error)")
                    completion(error.localizedDescription, nil)
                }
            }
        }
    }
    
    
    // Asset Get by id
    func getAssets(id : String ,completion: @escaping (String?, AssetByIdResponseModel?) -> Void) {
        let stringUrl = "\(AppURL.assetsById)/\(id)"
        let authKey = Token.key
        let _headers : HTTPHeaders = ["X-RapidAPI-Key": "\(authKey)",
                                      "X-RapidAPI-Host": "bravenewcoin.p.rapidapi.com"]
        
        if let url = URL(string: stringUrl) {
            AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: _headers).responseData { response in
                debugPrint(response)
                switch response.result {
                case .success(let data):
                    print(String(describing: String(data: data, encoding: .utf8)))
                    do {
                        let asJSON = try JSONDecoder().decode(AssetByIdResponseModel.self, from: data)
                        completion(nil, asJSON)
                    } catch {
                        print("Error while decoding response: " + String(describing: error) + " from: \(String(describing: String(data: data, encoding: .utf8)))")
                        completion(error.localizedDescription, nil)
                    }
                case .failure(let error):
                    print("failure \(error)")
                    completion(error.localizedDescription, nil)
                }
            }
        }
    }
    
    //Market Get By id
    func getMarketById(id : String ,completion: @escaping (String?, MarketDetailResponseModel?) -> Void) {
        let stringUrl = "\(AppURL.marketById)/\(id)"
        let authKey = Token.key
        let _headers : HTTPHeaders = ["X-RapidAPI-Key": "\(authKey)",
                                      "X-RapidAPI-Host": "bravenewcoin.p.rapidapi.com"]
        
        if let url = URL(string: stringUrl) {
            AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: _headers).responseData { response in
                debugPrint(response)
                switch response.result {
                case .success(let data):
                    print(String(describing: String(data: data, encoding: .utf8)))
                    do {
                        let asJSON = try JSONDecoder().decode(MarketDetailResponseModel.self, from: data)
                        completion(nil, asJSON)
                    } catch {
                        print("Error while decoding response: " + String(describing: error) + " from: \(String(describing: String(data: data, encoding: .utf8)))")
                        completion(error.localizedDescription, nil)
                    }
                case .failure(let error):
                    print("failure \(error)")
                    completion(error.localizedDescription, nil)
                }
            }
        }
    }
    
    
}
