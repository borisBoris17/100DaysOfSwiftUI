//
//  DisableDemoView.swift
//  Flashvilla
//
//  Created by tucker bichsel on 10/08/2023.
//

import SwiftUI

struct DisableDemoView: View {
    var body: some View {
        VStack {
            Text("Hello")
            Spacer().frame(height: 100)
            Text("World")
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print("VStack Tapped")
        }
        //        ZStack {
        //            Rectangle()
        //                .fill(.blue)
        //                .frame(width: 300, height: 300)
        //                .onTapGesture {
        //                    print("Rectangle Tapped")
        //                }
        //
        //            Circle()
        //                .fill(.red)
        //                .frame(width: 300, height: 300)
        //                .contentShape(Rectangle())
        //                .onTapGesture {
        //                    print("Circle Tapped")
        //                }
        ////                .allowsHitTesting(false)
        //        }
    }
}

struct DisableDemoView_Previews: PreviewProvider {
    static var previews: some View {
        DisableDemoView()
    }
}
