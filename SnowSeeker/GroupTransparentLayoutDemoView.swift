//
//  GroupTransparentLayoutDemoView.swift
//  SnowSeeker
//
//  Created by tucker bichsel on 16/08/2023.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: Englang")
            Text("Pets: Luna and Arya")
        }
        .font(.title)
    }
}

struct GroupTransparentLayoutDemoView: View {
    @Environment(\.horizontalSizeClass) var sizeClass
    
    var body: some View {
        Group {
            if sizeClass == .compact {
                VStack {
                    UserView()
                }
            } else {
                HStack {
                    UserView()
                }
            }
        }
    }
}

struct GroupTransparentLayoutDemoView_Previews: PreviewProvider {
    static var previews: some View {
        GroupTransparentLayoutDemoView()
    }
}
