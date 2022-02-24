//
//  Serie.swift
//  VmazeWebsite
//
//  Created by Pedro Valderrama on 11/02/2022.
//



import Foundation

struct Image: Decodable {
    var original: String
    var medium: String
}




//■ Name
//■ Poster
//■ Days in which the series airs and the time
//■ Genres
//■ Summary
//■ List of episodes separated by season


struct Serie: Decodable {
    var id: Int?
    var name: String?
    var image: Image?
    var premiered: Date
    var ended: Date
//    var timeInTheAirs: CFTimeInterval {
//        CFDateGetTimeIntervalSinceDate(premiered, ended)
//    }

    var genres: [String]?
    var summary: String?
    var episodes: [Episode]?
}

struct SearchSerie: Decodable {
    var score: Double
    var show: Serie
}
