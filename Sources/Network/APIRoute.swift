//
//  APIRoute.swift
//  PriceChartingIOS
//
//  Created by Guillaume ZURBACH on 10/03/2023.
//

import Foundation
import Alamofire
import Network

struct APIRoute: APIRouteable {

    var baseURL: String
    var path: String
    var method: HTTPMethod
    var parameters: Parameters?
    var encoding: ParameterEncoding

}
