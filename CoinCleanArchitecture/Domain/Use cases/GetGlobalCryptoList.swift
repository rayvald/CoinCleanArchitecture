//
//  GetGlobalCryptoList.swift
//  CoinCleanArchitecture
//
//  Created by Raynier Murillo on 12/31/23.
//

import Foundation

class GetGlobalCryptoList {
    
    private let repository: GlobalCryptoListRespositoryType
    
    init(repository: GlobalCryptoListRespositoryType) {
        self.repository = repository
    }
    
    func execute() async -> Result<[Cryptocurrency], CryptoCurrencyDomainError> {
        let result = await repository.getGlobalCryptoList()
        
        guard let cryptoList = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }
            return .failure(error)
        }
        
        return .success(cryptoList.sorted {$0.marketCap > $1.marketCap})
    }
}
