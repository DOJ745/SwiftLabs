//
//  HobbyDetail.swift
//  LB7
//
//  Created by AdminUser on 19.05.21.
//

import SwiftUI

struct HobbyDetail: View {
    
    @State private var progress = 0.01
    
    var hobbyItem: Hobby
    
    var body: some View {
        
        ScrollView {
            
            ImageView(image:
                        hobbyItem.image
                        .resizable()
            )
                .ignoresSafeArea(edges: .top)
                .padding()
            
            Text("Add progress to your hobby")
            
            ProgressView(value: progress)
                .frame(height: 20.0)
            Button("Add", action: { progress += 0.05 })
            Divider()
            
            VStack(alignment: .leading){
                Text(hobbyItem.name)
                    .font(.title)
                    .foregroundColor(.primary)
                
                HStack {
                    Text("Difficulty: " + hobbyItem.difficulty)
                        .foregroundColor(.secondary)
                    Spacer()
                    Link("Visit site",
                         destination: URL(string: hobbyItem.site)!)
                }
                .font(.title2)
                
                Divider()
                Text("About hobby")
                    .font(.title2)
                Text(hobbyItem.description)
                
            }
            .padding()
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity)
        .navigationTitle(hobbyItem.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HobbyDetail_Previews: PreviewProvider {
    static var previews: some View {
        HobbyDetail(hobbyItem: hobbies[0])
    }
}
