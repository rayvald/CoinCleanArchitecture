//
//  ApiDataSourceType.swift
//  CoinCleanArchitecture
//
//  Created by Raynier Murillo on 12/31/23.
//

import Foundation


protocol ApiDataSourceType {
    func getGlobalCryptoSymbolList() async -> Result<[String], HttpClientErrors>
    func getCryptoList() async -> Result<[CryptocurrencyBasicDTO], HttpClientErrors>
    func getPriceInfoForCryptos(id: [String]) async -> Result<[String: CryptoCurrencyPriceDTO], HttpClientErrors>
}
