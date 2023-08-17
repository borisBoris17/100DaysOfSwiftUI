//
//  ContentView.swift
//  DiceRoll
//
//  Created by tucker bichsel on 16/08/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var diceRoll = 6
    @State private var previousRolls = [Int]()
    @State private var isRolling = false
    @State private var selectedDi = 6
        
    let savePath = FileManager.documentsDirectory.appendingPathComponent("previousRolls")
    
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(diceRoll)")
                .font(.custom("diceRollSize", size: 250, relativeTo: .largeTitle))
            
            Spacer()
            
            ZStack {
                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(.secondary)
                    .shadow(radius: 10)
                
                VStack {
                    Text("Previous Rolls")
                        .font(.largeTitle)
                    
                    ForEach(0..<10) { index in
                        if (index < previousRolls.count) {
                            HStack {
                                Text("\(previousRolls[index])")
                                    .font(.title)
                            }
                        }
                    }
                }
                .padding(.horizontal, 30)
            }
            
            HStack {
                HStack {
                    Image(systemName: "dice")
                    Text("\(selectedDi) Sided")
                }
                .contextMenu {
                    Button {
                        selectedDi = 4
                    } label: {
                        Label("4 Sided", systemImage: "4.square")
                    }
                    Button {
                        selectedDi = 6
                    } label: {
                        Label("6 Sided", systemImage: "6.square")
                    }
                    Button {
                        selectedDi = 8
                    } label: {
                        Label("8 Sided", systemImage: "8.square")
                    }
                    Button {
                        selectedDi = 10
                    } label: {
                        Label("10 Sided", systemImage: "10.square")
                    }
                    Button {
                        selectedDi = 20
                    } label: {
                        Label("20 Sided", systemImage: "20.square")
                    }
                }
                
                Spacer()
                
                Button {
                    Task {
                        await rollDice()
                    }
                } label: {
                    Text("Roll")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.horizontal, 60)
                        .padding(.vertical, 10)
                        .background(.blue)
                        .clipShape(Capsule())
            }
            }
        }
        .padding()
        .onAppear(perform: loadPreviousRolls)
        .onReceive(timer) { time in
            guard isRolling else { return }
            
            diceRoll = Int.random(in: 1...selectedDi)
        }
    }
    
    
    
    func rollDice() async {
        isRolling = true
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        finishRoll()
    }
    
    func finishRoll() {
        isRolling = false
        let newRoll = Int.random(in: 1...selectedDi)
        var newRolls = [Int]()
        newRolls.append(newRoll)
        for i in 0...8 {
            if i <= previousRolls.count {
                newRolls.append(previousRolls[i])
            }
        }
        previousRolls = newRolls
        print(previousRolls)
        diceRoll = newRoll
        save()
    }
    
    func loadPreviousRolls() {
        do {
            let data = try  Data(contentsOf: savePath)
            previousRolls = try JSONDecoder().decode([Int].self, from: data)
        } catch {
            print("Error reading from file storage: \(error.localizedDescription)")
            previousRolls = []
        }
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(previousRolls)
            try data.write(to: savePath, options: [.atomic, .completeFileProtection])
        } catch {
            print("Error while saving data: \(error.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
