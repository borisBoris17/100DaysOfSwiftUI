//
//  DependencyDemoView.swift
//  HotProspects
//
//  Created by tucker bichsel on 07/08/2023.
//
//import SamplePackage
import SwiftUI

struct DependencyDemoView: View {
    let possibleNumbers = Array(1...60)
    
    var body: some View {
        Text(results)
    }
    
    var results: String {
        return "random"
//        let selected = possibleNumbers.random(7).sorted()
//        let strings = selected.map(String.init)
//        return strings.joined(separator: ", ")
    }
}

struct DependencyDemoView_Previews: PreviewProvider {
    static var previews: some View {
        DependencyDemoView()
    }
}

