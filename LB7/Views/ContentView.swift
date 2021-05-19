//
//  ContentView.swift
//  LB7
//
//  Created by AdminUser on 8.04.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(){
            ImageView()
            Divider()
            
            VStack(alignment: .center) {
                Text("Hobbies")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.red)
                Text("Tap on element to see details").font(.title3)
            }
            Spacer()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
