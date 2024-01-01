//
//  CryptoCurrencyDomainError.swift
//  CoinCleanArchitecture
//
//  Created by Raynier Murillo on 12/31/23.
//

import Foundation

/**
 Aquí se define un enum llamado CryptoCurrencyDomainError que conforma al protocolo Error.
 Este enum tiene un caso generic que podría utilizarse para representar un error genérico en el dominio de criptomonedas.
 */
enum CryptoCurrencyDomainError: Error {
    case generic
}

