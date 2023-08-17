//
//  CustonRowSwipeView.swift
//  HotProspects
//
//  Created by tucker bichsel on 07/08/2023.
//

import SwiftUI

struct CustonRowSwipeView: View {
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button(role: .destructive) {
                        print("Deleting")
                    } label: {
                        Label("Delete", systemImage: "minus.circle")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button {
                        print("Pinning")
                    } label: {
                        Label("Pin", systemImage: "pin")
                    }
                    .tint(.orange)
                }
        }
    }
}

struct CustonRowSwipeView_Previews: PreviewProvider {
    static var previews: some View {
        CustonRowSwipeView()
    }
}
