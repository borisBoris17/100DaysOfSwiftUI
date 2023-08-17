//
//  AcquaintanceDetailView-ModelView.swift
//  FaceToName
//
//  Created by tucker bichsel on 05/08/2023.
//

import MapKit
import Foundation

extension AcquaintanceDetailView {
    @MainActor class ViewModel: ObservableObject {
//        @Published var acquaintance: Acquaintance
        @Published var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 50, longitude: 0), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
        @Published var locations: [Location]
        
        init(acquaintance: Acquaintance) {
            mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: acquaintance.location.latitude, longitude: acquaintance.location.longitude), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
            locations = [acquaintance.location]
        }
        
//        func updateMapRegion(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
//            mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
//        }
        
//        var mapRegion:
    }
}
