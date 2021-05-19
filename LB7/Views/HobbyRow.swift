//
//  HobbyRow.swift
//  LB7
//
//  Created by AdminUser on 27.04.21.
//

import SwiftUI

struct HobbyRow: View {
    
    var hobby: Hobby
    var body: some View {
        
        HStack {
            hobby.image.resizable().frame(width: 100, height: 100)
            Text(hobby.name)
                .font(.title2)
                .foregroundColor(.primary)
            Spacer()
        }
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color(red: 1.0, green: 0.627, blue: 0.478)/*@END_MENU_TOKEN@*/)
    }
}

struct HobbyRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HobbyRow(hobby: hobbies[0])
            HobbyRow(hobby: hobbies[1])
        }
        .previewLayout(.fixed(width: 300, height: 100))
    }
}
