//
//  AcquaintanceDetailView.swift
//  FaceToName
//
//  Created by tucker bichsel on 04/08/2023.
//
import MapKit
import SwiftUI

struct AcquaintanceDetailView: View {
    var acquaintance: Acquaintance
    
    @StateObject private var viewModel: ViewModel
    
    init(acquaintance: Acquaintance) {
        self.acquaintance = acquaintance
        _viewModel = StateObject(wrappedValue: ViewModel(acquaintance: acquaintance))
    }
    
    var body: some View {
        VStack {
            acquaintance.image
                .resizable()
                .scaledToFit()
            Text(acquaintance.name)
                .font(.title)
            Text(acquaintance.description)
                .font(.body)
            Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) { location in
                MapMarker(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
            }
        }
    }
}

struct AcquaintanceDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AcquaintanceDetailView(acquaintance: Acquaintance.example)
    }
}
