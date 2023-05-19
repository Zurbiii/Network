//
//  APIRoute.swift
//  PriceChartingIOS
//
//  Created by Guillaume ZURBACH on 10/03/2023.
//

import Foundation
import Alamofire
import Network

public struct APIRoute: APIRouteable {

    public var baseURL: String
    public var path: String
    public var method: HTTPMethod
    public var parameters: Parameters?
    public var encoding: ParameterEncoding

}
