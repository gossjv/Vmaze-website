//
//  Serie.swift
//  VmazeWebsite
//
//  Created by Pedro Valderrama on 11/02/2022.
//



import Foundation

class Serie: Decodable {
    var id: Int
    var name: String
//    var premiered: Date
//    var ended: Date
//    var timeInTheAirs: CFTimeInterval {
//        CFDateGetTimeIntervalSinceDate(premiered, ended)
//    }
//    var image: String {
//        let medium: String
//        let original: String
//    }
    var genres: [String]?
    var summary: String
//    var episodes: [Episode]?
}
