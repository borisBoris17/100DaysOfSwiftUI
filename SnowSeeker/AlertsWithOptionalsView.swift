//
//  AlertsWithOptionalsView.swift
//  SnowSeeker
//
//  Created by tucker bichsel on 16/08/2023.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct AlertsWithOptionalsView: View {
    @State private var isShowingUser = false
    @State private var selectedUser: User? = nil
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                selectedUser = User()
                isShowingUser = true
            }
            .alert("Welcome", isPresented: $isShowingUser) { }
//            .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
//                Button(user.id) { }
//            }
//            .sheet(item: $selectedUser) { user in
//                Text(user.id)
//            }
    }
}

struct AlertsWithOptionalsView_Previews: PreviewProvider {
    static var previews: some View {
        AlertsWithOptionalsView()
    }
}
