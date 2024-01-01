//
//  CryptoCurrencyRespository.swift
//  CoinCleanArchitecture
//
//  Created by Raynier Murillo on 12/31/23.
//

import Foundation

class CryptocurrencyDomainErrorMapper {
    func map(error: HttpClientErrors?) -> CryptoCurrencyDomainError {
        return .generic
    }
}

extension Result {
    var failureValue: Error? {
        switch self {
        case .failure(let error):
            return error
        case .success:
            return nil
        }
    }
}

class CryptoCurrencyRespository: GlobalCryptoListRespositoryType {
    
    private let apiDataSource: ApiDataSourceType
    private let errorMapper: CryptocurrencyDomainErrorMapper
    
    init(apiDataSource: ApiDataSourceType, errorMapper: CryptocurrencyDomainErrorMapper){
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
    }
    
    func getGlobalCryptoList() async -> Result<[Cryptocurrency], CryptoCurrencyDomainError> {
        
        let symbolListResult = await apiDataSource.getGlobalCryptoSymbolList()
        let cryptoListResult = await apiDataSource.getCryptoList()
        
        guard case .success(let symbolList) = symbolListResult else {
            return .failure(errorMapper.map(error: symbolListResult.failureValue as? HttpClientErrors))
        }

        guard case .success(let cryptoList) = cryptoListResult else {
            return .failure(errorMapper.map(error: cryptoListResult.failureValue as? HttpClientErrors))
        }
        
        
        var symbolListDict = [String: Bool]()
        symbolList.forEach { symbol in
            symbolListDict[symbol] = true
        }
        
        let globalCryptoList = cryptoList.filter {symbolListDict[$0.symbol] ?? false }
                
        let priceInfoResult = await apiDataSource.getPriceInfoForCryptos(id: globalCryptoList.map{ $0.id })
        guard case .success(let priceInfo) = priceInfoResult else {
            guard case .failure(let error) = priceInfoResult else {
                return .failure(.generic)
            }
            
            return .failure(errorMapper.map(error: error))
        }

        
        //https://api.coingecko.com/api/v3/global

        
        //https://api.coingecko.com/api/v3/simple/price?ids=bitcoin%2Cripple&vs_currencies=usd&include_market_cap=true&include_24hr_vol=true&include_24hr_change=true&include_last_updated_at=true
        
        //https://api.coingecko.com/api/v3/coins/list?include_platform=false

    }
}
