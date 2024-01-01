//
//  CryptocurrencyBasicDTO.swift
//  CoinCleanArchitecture
//
//  Created by Raynier Murillo on 12/31/23.
//

import Foundation

struct CryptocurrencyBasicDTO: Codable {
    let id: String
    let symbol: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name
    }
}
