//
//  RequestProducer.swift
//  PriceChartingIOS
//
//  Created by Guillaume ZURBACH on 09/03/2023.
//

import Foundation
import Alamofire

public protocol RequestProducerProtocol {

    static func request<T: Decodable>(_ apiRoute: APIRouteable,
                                      completion: @escaping (Result<T, Error>) -> Void)

}

public final class RequestProducer: RequestProducerProtocol {
    
    public static func request<T: Decodable>(_ apiRoute: APIRouteable,
                                      completion: @escaping (Result<T, Error>) -> Void) {
        let dataRequest = AF.request(apiRoute)
        dataRequest
            .validate(statusCode: 200..<300)
            .responseDecodable(completionHandler: { [weak dataRequest] (response: DataResponse<T, AFError>) in
                dataRequest.map { debugPrint($0) }
                switch response.result {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    completion(.failure(error))
                }
            })
    }

}