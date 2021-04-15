//
//  ImageView.swift
//  LB7
//
//  Created by AdminUser on 15.04.21.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        Image("main_icon_128")
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.black, lineWidth: 4.0))
            .shadow(radius: 7)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
