//
//  HobbyDetail.swift
//  LB7
//
//  Created by AdminUser on 19.05.21.
//

import SwiftUI

struct HobbyDetail: View {
    
    @State private var progress = 0.01
    
    var body: some View {

        VStack {
            
            ImageView()
                .ignoresSafeArea(edges: .top)
                .padding()
            
            Text("Add progress to hobby")
            
            ProgressView(value: progress)
                .frame(height: 20.0)
            Button("Add", action: { progress += 0.05 })
            Divider()
            
            VStack(alignment: .leading){
                Text("Some hobby")
                    .font(.title)
                    .foregroundColor(.primary)
                
                HStack {
                    Text("Hobby type")
                        .foregroundColor(.secondary)
                    Spacer()
                    Link("Hobby site",
                          destination: URL(string: "https://www.example.com/TOS.html")!)
                }
                .font(.title2)
                
                Divider()
                Text("About hobby")
                    .font(.title2)
                Text("Hobby description")
                
            }
            .padding()
            Spacer()
            
            Divider()
        }
    }
}

struct HobbyDetail_Previews: PreviewProvider {
    static var previews: some View {
        HobbyDetail()
    }
}
