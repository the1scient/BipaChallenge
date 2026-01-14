//
//  APIError.swift
//  BipaChallenge
//
//  Created by Guilherme Fabbri on 14/01/26.
//

import Foundation

enum APIError : Error, LocalizedError {
    
    case invalidURL
    case failedRequest
    case responseInvalid
    case failedDecoding
    case noData
    case unreachable
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "URL inválida"
        case .failedRequest:
            return "Falha no Request"
        case .responseInvalid:
            return "Resposta da API é inválida!"
        case .failedDecoding:
            return "Erro ao fazer decoding"
        case .noData:
            return "API não retornou dados"
        case .unreachable
            return "Houve um problema de conexão!"
        }
        
        
    }
    
}
