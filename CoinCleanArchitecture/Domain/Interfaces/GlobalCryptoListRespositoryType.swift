//
//  GlobalCryptoListRespositoryType.swift
//  CoinCleanArchitecture
//
//  Created by Raynier Murillo on 12/31/23.
//

import Foundation

/**
 Se define un protocolo llamado GlobalCryptoListRespositoryType.
 Este protocolo tiene un solo método getGlobalCryptoList, que devuelve un tipo Result que puede contener un array de objetos Cryptocurrency o un error de tipo CryptoCurrencyDomainError.
 El método es asíncrono, indicado por la palabra clave async.
 */
protocol GlobalCryptoListRespositoryType {
    func getGlobalCryptoList() async -> Result<[Cryptocurrency], CryptoCurrencyDomainError>
}
