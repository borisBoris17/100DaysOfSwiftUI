//
//  Location.swift
//  FaceToName
//
//  Created by tucker bichsel on 05/08/2023.
//

import Foundation
import CoreLocation

struct Location: Equatable, Identifiable, Codable {
    static let example = Location(id: UUID(), latitude: 51.501, longitude: -0.141)

    var id: UUID
    let latitude: Double
    let longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
    
}
