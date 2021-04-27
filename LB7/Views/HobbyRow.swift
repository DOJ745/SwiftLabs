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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HobbyRow_Previews: PreviewProvider {
    static var previews: some View {
        HobbyRow(hobby: hobbies[0])
    }
}
