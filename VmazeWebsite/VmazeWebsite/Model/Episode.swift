//
//  Episodes.swift
//  VmazeWebsite
//
//  Created by Pedro Valderrama on 11/02/2022.
//

import Foundation

class Episode: Decodable {
    
    var id: Int
    var name: String
    var season: Int
    var number: Int
    var summary: String
//    var image
}
