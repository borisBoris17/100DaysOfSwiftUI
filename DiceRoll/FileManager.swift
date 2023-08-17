//
//  FileManager.swift
//  DiceRoll
//
//  Created by tucker bichsel on 16/08/2023.
//

import Foundation

extension FileManager {
    
    static var documentsDirectory: URL {
        // find all possible documents directories for this user
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        // just send back the first one, which ought to be the only one
        return paths[0]
    }
    
    
}
