//
//  HobbyList.swift
//  LB7
//
//  Created by AdminUser on 19.05.21.
//

import SwiftUI

struct HobbyList: View {
    var body: some View {
        List(hobbies){ hobbyElem in
            HobbyRow(hobby: hobbyElem)
        }
    }
}

struct HobbyList_Previews: PreviewProvider {
    static var previews: some View {
        HobbyList()
    }
}
