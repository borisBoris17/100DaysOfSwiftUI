//
//  EditCards.swift
//  Flashvilla
//
//  Created by tucker bichsel on 11/08/2023.
//

import SwiftUI

struct EditCards: View {
    @State private var cards = [Card]()
    @Environment(\.dismiss) var dismiss
    
    @State private var prompt = ""
    @State private var answer = ""
    
    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedCards")
    
    var body: some View {
        
        NavigationView {
            List {
                Section("Add New Card") {
                    TextField("Prompt", text: $prompt)
                    TextField("Answer", text: $answer)
                    Button("Add Card", action: createNewCard)
                }
                
                ForEach(0..<cards.count, id: \.self) { index in
                    VStack(alignment: .leading) {
                        Text(cards[index].prompt)
                            .font(.headline)
                        
                        Text(cards[index].answer)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                ToolbarItem {
                    Button("Done", action: done)
                }
            }
        }
        .listStyle(.grouped)
        .onAppear {
            cards = FileManager.loadCards(savePath: savePath)
        }
    }
    
    func done() {
        dismiss()
    }
    
    func createNewCard() {
        let trimmedPrompt = prompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = answer.trimmingCharacters(in: .whitespaces)
        guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else { return }
        
        let newCard = Card(prompt: trimmedPrompt, answer: trimmedAnswer)
        cards.append(newCard)
        prompt = ""
        answer = ""
        FileManager.saveCards(cards: cards, savePath: savePath)
    }
    
    func delete(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        FileManager.saveCards(cards: cards, savePath: savePath)
    }
}

struct EditCards_Previews: PreviewProvider {
    static var previews: some View {
        EditCards()
    }
}
