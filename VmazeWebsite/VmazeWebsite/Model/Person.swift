//
//  Person.swift
//  VmazeWebsite
//
//  Created by Pedro Valderrama on 11/02/2022.
//

import Foundation

class Person: Decodable {
    var name: String?
//    var image
    var seriesParticipated: [Serie]?
}
