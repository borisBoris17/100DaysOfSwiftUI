//
//  Favorites.swift
//  SnowSeeker
//
//  Created by tucker bichsel on 17/08/2023.
//

import Foundation

class Favorites: ObservableObject {
    private var resorts: [String]
    private let saveKey = "Favorites"
    
    init() {
        // load out saved data
        do {
            let data = try Data(contentsOf: FileManager.documentsDirectory.appendingPathComponent(saveKey))
            resorts = try JSONDecoder().decode([String].self, from: data)
        } catch {
            print("Error fetching resorts ")
            resorts = []
        }
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.append(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        guard let removeIndex = resorts.firstIndex(of: resort.id) else { return }
        objectWillChange.send()
        resorts.remove(at: removeIndex)
        save()
    }
    
    func save() {
        // write our data here
        do {
            let data = try JSONEncoder().encode(resorts)
            try data.write(to: FileManager.documentsDirectory.appendingPathComponent(saveKey), options: [.atomic, .completeFileProtection])
        } catch {
            print("Error while trying to save favorites")
        }
    }
}
