//
//  ContentView.swift
//  FaceToName
//
//  Created by tucker bichsel on 01/08/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    
    var locationFetcher = LocationFetcher()
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    
                    ForEach(viewModel.acquaintances) { acquaintance in
                        NavigationLink {
                            AcquaintanceDetailView(acquaintance: acquaintance)
                        } label: {
                            HStack {
                                acquaintance.image
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .scaledToFit()
                                Text(acquaintance.name)
                                
                            }
                        }
                    }
                }
                .navigationTitle("Aquaintances")
                .toolbar {
                    ToolbarItem {
                        Button {
                            viewModel.showingAddAcquaintance = true
                        } label: {
                            Image(systemName: "plus")
                                .padding()
                                .background(.blue.opacity(0.5))
                                .foregroundColor(.white)
                                .clipShape(Circle())
                        }
                    }
                }
                .onAppear {
                    self.locationFetcher.start()
                }
            }
            .sheet(isPresented: $viewModel.showingAddAcquaintance) {
                AddAcquaintance(locationFetcher: self.locationFetcher) { acquaintance in
                    viewModel.addAcquaintance(newAcquaintance: acquaintance)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
