//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by tucker bichsel on 30/07/2023.
//

import Foundation

extension FileManager {
    
    public static func loadCards(savePath: URL) -> [Card] {
        do {
            let data = try  Data(contentsOf: savePath)
            return try JSONDecoder().decode([Card].self, from: data)
        } catch {
            print("Error reading from file storage: \(error.localizedDescription)")
            return []
        }
    }
    
    public static func saveCards(cards: [Card], savePath: URL) {
        do {
            let data = try JSONEncoder().encode(cards)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Error while saving data: \(error.localizedDescription)")
        }
    }
    
    static var documentsDirectory: URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        // just send back the first one, which ought to be the only one
        return paths[0]
    }
    
    
}
