//
//  RequestionProducerProtocol.swift
//  
//
//  Created by Guillaume ZURBACH on 12/03/2023.
//

import Foundation

public protocol RequestProducerProtocol {

    static func request<T: Decodable>(_ apiRoute: APIRouteable,
                                      completion: @escaping (Result<T, Error>) -> Void)
    
    @available(iOS 13.0, *)
    static func request<T: Decodable>(_ apiRoute: APIRouteable) async throws -> Result<T, Error>

}
