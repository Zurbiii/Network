//
//  RequestProducer.swift
//  
//
//  Created by Guillaume ZURBACH on 09/03/2023.
//

import Foundation
import Alamofire

public final class RequestProducer: RequestProducerProtocol {
    
    @available(iOS 13.0, *)
    public static func request<T: Decodable>(_ apiRoute: APIRouteable) async throws -> Result<T, Error> {
        let dataRequest = AF.request(apiRoute)
        Task {
            return try withCheckedThrowingContinuation { continuation in
                dataRequest
                    .validate(statusCode: 200..<300)
                    .responseDecodable(completionHandler: { [weak dataRequest] (response: DataResponse<T, AFError>) in
                        dataRequest.map { debugPrint($0) }
                        switch response.result {
                        case .success(let response):
                            continuation.resume(returning: response)
                        case .failure(let error):
                            continuation.resume(throwing: error)
                        }
                    })
            }
        }
    }
    
    public static func request<T: Decodable>(_ apiRoute: APIRouteable,
                                             completion: @escaping (Result<T, Error>) -> Void) {
        let dataRequest = AF.request(apiRoute)
        dataRequest
            .validate(statusCode: 200..<300)
            .responseDecodable(completionHandler: { [weak dataRequest] (response: DataResponse<T, AFError>) in
                dataRequest.map { debugPrint($0) }
//                let responseData = response.data ?? Data()
//                let string = String(data: responseData, encoding: .utf8)
//                print("Response string: \(string ?? "")")
                switch response.result {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    completion(.failure(error))
                }
            })
    }

}
