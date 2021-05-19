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
            hobby.image.resizable().frame(width: 80, height: 80)
            Text(hobby.name)
            Text(hobby.description)
        }
    }
}

struct HobbyRow_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            HobbyRow(hobby: hobbies[0])
            HobbyRow(hobby: hobbies[1])
        }.previewLayout(.fixed(width: 300, height: 80))
        
    }
}
