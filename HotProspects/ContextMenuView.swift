//
//  ContextMenuView.swift
//  HotProspects
//
//  Created by tucker bichsel on 07/08/2023.
//

import SwiftUI

struct ContextMenuView: View {
    @State private var backgroundColor = Color.red
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding()
            .background(backgroundColor)
        
        Text("Change Color")
            .padding()
            .contextMenu {
                Button() {
                    backgroundColor = .red
                } label: {
                    Label("Red", systemImage: "checkmark.circle.fill")
                }
                Button("Green") {
                    backgroundColor = .green
                }
                Button("Blue") {
                    backgroundColor = .blue
                }
            }
    }
}

struct ContextMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContextMenuView()
    }
}
