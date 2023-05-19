//
//  APIRoute.swift
//  PriceChartingIOS
//
//  Created by Guillaume ZURBACH on 10/03/2023.
//

import Foundation
import Alamofire

public struct APIRoute: APIRouteable {
    
    public init(baseURL: String,
                path: String,
                method: HTTPMethod,
                parameters: Parameters?,
                encoding: ParameterEncoding) {
        self.baseURL = baseURL
        self.path = path
        self.method = method
        self.parameters = parameters
        self.encoding = encoding
    }

    public var baseURL: String
    public var path: String
    public var method: HTTPMethod
    public var parameters: Parameters?
    public var encoding: ParameterEncoding

}
