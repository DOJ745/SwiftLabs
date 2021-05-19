//
//  HobbyList.swift
//  LB7
//
//  Created by AdminUser on 19.05.21.
//

import SwiftUI

struct HobbyList: View {
    var body: some View {
        NavigationView{
            List(hobbies){ hobbyElem in
                NavigationLink(destination: HobbyDetail()){
                    HobbyRow(hobby: hobbyElem)
                }
            }
            .navigationTitle("Hobby List")
        }
    }
}

struct HobbyList_Previews: PreviewProvider {
    static var previews: some View {
        HobbyList()
    }
}
