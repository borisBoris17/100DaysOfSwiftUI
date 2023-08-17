//
//  TimerDemoView.swift
//  Flashvilla
//
//  Created by tucker bichsel on 10/08/2023.
//

import SwiftUI

struct TimerDemoView: View {
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(timer) { time in
                if counter == 5 {
                    timer.upstream.connect().cancel()
                } else {
                    print("The Time is now \(time)")
                }
                
                counter += 1
            }
    }
}

struct TimerDemoView_Previews: PreviewProvider {
    static var previews: some View {
        TimerDemoView()
    }
}
