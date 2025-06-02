//
//  Location.swift
//  Map Application
//
//  Created by Ismam Ferdous on 5/23/25.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {

    
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String

    // Automatically conforms to Identifiable
    var id: String {
        name + cityName
    }
    // ts is for equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
}

