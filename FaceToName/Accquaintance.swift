//
//  Accquaintance.swift
//  FaceToName
//
//  Created by tucker bichsel on 01/08/2023.
//

import SwiftUI
import MapKit
import Foundation

struct Acquaintance: Codable, Identifiable, Equatable {
    var id: UUID
    var imageData: Data?
    var name: String
    var description: String
    var location: Location
    
    var image: Image {
        guard let imageData = imageData else { return Image(systemName: "photo") }
        guard let uiImage = UIImage(data: imageData) else { return Image(systemName: "photo") }
        return Image(uiImage: uiImage)
    }
    
    static let example = Acquaintance(id: UUID(), imageData: nil, name: "Some Name", description: "From the thing", location: Location(id: UUID(), latitude: 51.501, longitude: -0.141))
}
