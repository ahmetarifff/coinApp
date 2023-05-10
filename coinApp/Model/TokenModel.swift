//
//  TokenModel.swift
//  coinApp
//
//  Created by Ahmet arif Yıldırım on 9.05.2023.
//

import Foundation
import UIKit

struct TokenResponses : Decodable {
    var accessToken, scope: String
    var expiresIn: Int
    var tokenType: String

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case scope
        case expiresIn = "expires_in"
        case tokenType = "token_type"
    }
}
