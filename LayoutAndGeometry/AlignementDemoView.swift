//
//  AlignementDemoView.swift
//  LayoutAndGeometry
//
//  Created by tucker bichsel on 14/08/2023.
//

import SwiftUI

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
        
        
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct AlignementDemoView: View {
    var body: some View {
//        HStack(alignment: .midAccountAndName) {
//            VStack {
//                Text("@twostraws")
//                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
//                Image("mickey")
//                    .resizable()
//                    .frame(width: 64, height: 64)
//            }
//
//            VStack {
//                Text("Full Name:")
//                Text("Paul Hudson")
//                    .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
//                    .font(.largeTitle)
//            }
//        }
//        HStack(alignment: .lastTextBaseline) {
//            Text("Live")
//                .font(.caption)
//            Text("long")
//            Text("and")
//                .font(.title)
//            Text("prosper")
//                .font(.largeTitle)
//        }
        VStack(alignment: .leading) {
            ForEach(0..<10) { position in
                Text("number \(position)")
//                    .alignmentGuide(.leading) { _ in
//                        Double(position) * -10
//                    }
            }
//            Text("Hello, world!")
//                .alignmentGuide(.leading) { d in
//                    d[.trailing]
//                }
            Text("This is a longer line of text")
        }
        .background(.red)
        .frame(width: 400, height: 400)
        .background(.blue)
    }
}

struct AlignementDemoView_Previews: PreviewProvider {
    static var previews: some View {
        AlignementDemoView()
    }
}
