//
//  ObjectWillChangeView.swift
//  HotProspects
//
//  Created by tucker bichsel on 07/08/2023.
//

import SwiftUI

@MainActor class DelayedUpdater: ObservableObject {
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}

struct ObjectWillChangeView: View {
    
    @StateObject private var updater = DelayedUpdater()
    var body: some View {
        Text("Value is \(updater.value)")
    }
}

struct ObjectWillChangeView_Previews: PreviewProvider {
    static var previews: some View {
        ObjectWillChangeView()
    }
}
