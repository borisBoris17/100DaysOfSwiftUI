//
//  AbsolutePosView.swift
//  LayoutAndGeometry
//
//  Created by tucker bichsel on 14/08/2023.
//

import SwiftUI

struct AbsolutePosView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .offset(x: 100, y: 100)
            .background(.red)
    }
}

struct AbsolutePosView_Previews: PreviewProvider {
    static var previews: some View {
        AbsolutePosView()
    }
}
