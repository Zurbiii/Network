//
//  APIRouteable.swift
//  
//
//  Created by Guillaume ZURBACH on 10/03/2023.
//

import Foundation
import Alamofire

public protocol APIRouteable: URLRequestConvertible {

    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }

}

public extension APIRouteable {

    func asURLRequest() throws -> URLRequest {
        let url = try baseURL.asURL().appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        return try encoding.encode(urlRequest, with: parameters)
    }

}
