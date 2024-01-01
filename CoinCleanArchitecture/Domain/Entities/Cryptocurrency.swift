//
//  Cryptocurrency.swift
//  CoinCleanArchitecture
//
//  Created by Raynier Murillo on 12/31/23.
//

import Foundation


struct Cryptocurrency {
    let id: String
    let name: String
    let symbol: String
    let price: Double
    let price24h: Double?
    let volume24h: Double?
    let marketCap: Double
}
