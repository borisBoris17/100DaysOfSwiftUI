//
//  GesturesDemoView.swift
//  Flashvilla
//
//  Created by tucker bichsel on 10/08/2023.
//

import SwiftUI

struct GesturesDemoView: View {
//    @State private var currentAmount = Angle.zero
//    @State private var finalAmount = Angle.zero
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    var body: some View {
        let dragGesture = DragGesture()
            .onChanged { value in
                offset = value.translation
            }
            .onEnded { _ in
                withAnimation {
                    offset = .zero
                    isDragging = false
                }
            }
        
        let pressGesture = LongPressGesture()
            .onEnded { value in
                withAnimation {
                    isDragging = true
                }
            }
        
        let combinded = pressGesture.sequenced(before: dragGesture)
        
        Circle()
            .fill(.red)
            .frame(width: 64, height: 64)
            .scaleEffect(isDragging ? 1.5 : 1)
            .offset(offset)
            .gesture(combinded)
        
//        VStack{
//            Text("Hello, World")
//                .onTapGesture {
//                    print("Text Tapped")
//                }
//        }
//        .simultaneousGesture(
//            TapGesture()
//                .onEnded {
//                    print("vStack Tapped")
//                }
//        )
        //        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        //            .rotationEffect(finalAmount + currentAmount)
        //            .gesture(
        //                RotationGesture()
        //                    .onChanged { angle in
        //                        currentAmount = angle
        //                    }
        //                    .onEnded { angle in
        //                        finalAmount += currentAmount
        //                        currentAmount = .zero
        //                    }
        //            )
        //            .onLongPressGesture(minimumDuration: 2) {
        //                print("LONG PRESS")
        //            } onPressingChanged: { inProgress in
        //                print("In progress: \(inProgress) ")
        //            }
    }
}

struct GesturesDemoView_Previews: PreviewProvider {
    static var previews: some View {
        GesturesDemoView()
    }
}
