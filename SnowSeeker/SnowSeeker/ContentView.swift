//
//  ContentView.swift
//  SnowSeeker
//
//  Created by tucker bichsel on 16/08/2023.
//

import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    @StateObject var favorites = Favorites()
    @State private var sortRule = SortOptions.none
    
    @State private var searchString = ""
    
    enum SortOptions {
        case none, alpha, country
    }
    
    var body: some View {
        NavigationView {
            List(filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 25)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchString, prompt: "Search for a Resort")
            .toolbar {
                ToolbarItem {
                    Menu("Sort") {
                        Button("Alphabetical") {
                            sortRule = .alpha
                        }
                        Button("Country") {
                            sortRule = .country
                        }
                        Button("Clear") {
                            sortRule = .none
                        }
                    }
                }
            }
            
            WelcomView()
        }
        .environmentObject(favorites)
        //        .phoneOnlyNavigationView()
    }
    
    var filteredResorts: [Resort] {
        var resortsToSort: [Resort]
        if searchString.isEmpty {
            resortsToSort = resorts
        } else {
            resortsToSort = resorts.filter { $0.name.localizedCaseInsensitiveContains(searchString)}
        }
        
        switch sortRule {
        case .country:
            return resortsToSort.sorted {
                $0.country < $1.country
            }
        case .alpha:
            return resortsToSort.sorted {
                $0.name < $1.name
            }
        default:
            return resortsToSort
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
