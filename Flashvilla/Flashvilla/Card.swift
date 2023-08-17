//
//  Card.swift
//  Flashvilla
//
//  Created by tucker bichsel on 10/08/2023.
//

import Foundation

public struct Card: Codable, Identifiable, Equatable {
    public var id = UUID()
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who", answer: "Jodie Whittaker")
}
