//
//  NavigationOnLargeScreenView.swift
//  SnowSeeker
//
//  Created by tucker bichsel on 16/08/2023.
//

import SwiftUI

struct NavigationOnLargeScreenView: View {
    var body: some View {
        VStack {
            NavigationView {
                NavigationLink {
                    Text("New secondary")
                } label: {
                    Text("Hello, world!")
                        .navigationTitle("Primary")
                }
                
                Text("Secondary")
                
                Text("Tertiary")
            }
        }
        .padding()
    }
}

struct NavigationOnLargeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationOnLargeScreenView()
    }
}
