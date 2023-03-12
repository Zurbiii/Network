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

}
