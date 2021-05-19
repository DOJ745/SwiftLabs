//
//  ContentView.swift
//  LB7
//
//  Created by AdminUser on 8.04.21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented = false
    
    var body: some View {
        
        TabView() {
            
            LazyVStack(alignment: .center) {
                ImageView(image: Image("main_icon_128"))
                Text("Hobbies")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.red)
                Text("Here you will find your favorite one").font(.title3)
                Spacer()
                Text("In this app you will find unusual hobbies, which you can find interestion or not, depends on your tastes. So, choose any that you like, making progress, and have fun").font(.subheadline).multilineTextAlignment(.center)
            }
            .tabItem {
                Image(systemName: "1.square.fill")
                Text("Info")
                
            }
            HobbyList()
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Hobby list")
                    
                }
            
        }
        .padding(.all, 5)
        .background(Color.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
