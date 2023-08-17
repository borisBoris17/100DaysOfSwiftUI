//
//  ContentView-ViewModel.swift
//  FaceToName
//
//  Created by tucker bichsel on 04/08/2023.
//

import Foundation

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        
        @Published var showingAddAcquaintance = false
        @Published private(set) var acquaintances = [Acquaintance]()
        
        let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedAcquaintances")
        
        init() {
            do {
                let data =  try Data(contentsOf: savePath)
                print(data)
                acquaintances = try JSONDecoder().decode([Acquaintance].self, from: data)
            } catch {
                acquaintances = []
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(acquaintances)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("unable to save...")
            }
        }
        
        func addAcquaintance(newAcquaintance: Acquaintance) {
            acquaintances.append(newAcquaintance)
            save()
        }
    }
}
