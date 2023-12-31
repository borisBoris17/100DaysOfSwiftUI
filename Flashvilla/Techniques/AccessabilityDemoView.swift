//
//  AccessabilityDemoView.swift
//  Flashvilla
//
//  Created by tucker bichsel on 10/08/2023.
//

import SwiftUI

func withOptionalAnimation<Result>(_ animation: Animation? = .default, _ body: () throws -> Result) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct AccessabilityDemoView: View {
//    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
//    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @State private var scale = 1.0
    
    var body: some View {
        Text("Hello Worlds!")
            .padding()
            .background(reduceTransparency ? .black : .black.opacity(0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
            
//        HStack {
//            if differentiateWithoutColor {
//                Image(systemName: "checkmark.circle")
//            }
//            Text("Success")
//        }
//        .padding()
//        .background(differentiateWithoutColor ? .black : .green)
//        .foregroundColor(.white)
//        .clipShape(Capsule())
    }
}

struct AccessabilityDemoView_Previews: PreviewProvider {
    static var previews: some View {
        AccessabilityDemoView()
    }
}
