//
//  NetworkingProvider.swift
//  VmazeWebsite
//
//  Created by Pedro Valderrama on 11/02/2022.
//

import Foundation
import Alamofire

typealias CallbackSerieType = (([Serie]?) -> Void)
typealias CallbackSearchSerieType = (([SearchSerie]?) -> Void)
typealias CallbackEpisodeType = (([Episode]?) -> Void)


final class NetworkingProvider {
    
    static let shared = NetworkingProvider()
    private let baseUrl = "https://api.tvmaze.com/"
    var series: [Serie] = []
    var searchSerie: [SearchSerie] = []
    var statusCodeOK = 200...299
    
    func getSerie(callback: @escaping CallbackSerieType){
     
        AF.request("\(baseUrl)shows", method: .get).validate(statusCode: statusCodeOK).responseDecodable (of: [Serie].self) {
            response in
            if let serie = response.value {
                callback(serie)
            } else {
                print(response.error?.responseCode ?? "Error")
            }
        }
    }
    
    func getSerieByName(serieName: String, callback: @escaping CallbackSearchSerieType) {
        AF.request("\(baseUrl)search/shows?q=\(String(describing: serieName))", method: .get).validate(statusCode: statusCodeOK).responseDecodable (of: [SearchSerie].self) {
            response in
            if let searchSerie = response.value {
                callback(searchSerie)
            } else {
                print(response.error?.responseCode ?? "Error")
            }
        }
    }
//    /shows/:id/episodes

    func getEpisode(serieID: Int, callback: @escaping CallbackEpisodeType) {
        AF.request("\(baseUrl)shows/\(serieID)/episodes", method: .get).validate(statusCode: statusCodeOK).responseDecodable (of: [Episode].self) {
            response in
            if let episodes = response.value {
                callback(episodes)
                print("tengo el beta")
            } else {
                print(response.error?.responseCode ?? "Error")
            }
        }
        
    }
    
}
