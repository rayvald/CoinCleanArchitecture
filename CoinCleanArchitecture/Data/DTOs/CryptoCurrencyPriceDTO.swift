//
//  CryptoCurrencyPriceDTO.swift
//  CoinCleanArchitecture
//
//  Created by Raynier Murillo on 12/31/23.
//

import Foundation

struct CryptoCurrencyPriceDTO: Codable {
    let usd: Double
    let usdMarketCap: Double
    let usd24hVol: Double
    let usd24hChange: Double
    let lastUpdatedAt: Double
    
    enum CodingKeys: String, CodingKey {
        case usd = "usd"
        case usdMarketCap = "usd_market_cap"
        case usd24hVol = "usd_24h_vol"
        case usd24hChange = "usd_24h_change"
        case lastUpdatedAt = "last_updated_at"
    }
}
