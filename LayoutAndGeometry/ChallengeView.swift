//
//  ChallengeView.swift
//  LayoutAndGeometry
//
//  Created by tucker bichsel on 14/08/2023.
//

import SwiftUI

struct ChallengeView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(Color(hue: Double(1 * geo.frame(in: .global).maxY / fullView.frame(in: .global).maxY), saturation: Double(1 * geo.frame(in: .global).maxY / fullView.frame(in: .global).maxY), brightness: Double(1 * geo.frame(in: .global).maxY / fullView.frame(in: .global).maxY)))
                            .background(colors[index % 7])
                            .scaleEffect(0.5 + geo.frame(in: .global).maxY / fullView.frame(in: .global).maxY)
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .opacity(geo.frame(in: .global).minY / 200 )
//                            .scaleEffect(fullView.frame(in: .global).maxY / 2 / geo.frame(in: .global).maxY)
//                            .scaleEffect(0.5)
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
