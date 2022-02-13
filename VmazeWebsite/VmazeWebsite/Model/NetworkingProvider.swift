//
//  NetworkingProvider.swift
//  VmazeWebsite
//
//  Created by Pedro Valderrama on 11/02/2022.
//

import Foundation
import Alamofire

final class NetworkingProvider {
    
    static let shared = NetworkingProvider()
    private let baseUrl = "https://api.tvmaze.com/"

    var statusCodeOK = 200...299
    
    func getSerie(id: Int) {
     
        AF.request("\(baseUrl)shows/\(id)", method: .get).validate(statusCode: statusCodeOK).responseDecodable (of: Serie.self) {
            response in
            if let serieName = response.value?.name {
                print(serieName)
            } else {
                print(response.error?.responseCode ?? "Error")
            }
        }
    }
}
