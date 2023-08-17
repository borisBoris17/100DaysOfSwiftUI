//
//  ToBackgroundDemoView.swift
//  Flashvilla
//
//  Created by tucker bichsel on 10/08/2023.
//

import SwiftUI

struct ToBackgroundDemoView: View {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .active {
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
}

struct ToBackgroundDemoView_Previews: PreviewProvider {
    static var previews: some View {
        ToBackgroundDemoView()
    }
}
