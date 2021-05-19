//
//  ImageView.swift
//  LB7
//
//  Created by AdminUser on 15.04.21.
//

import SwiftUI

struct ImageView: View {
    
    var image: Image
    
    var body: some View {
        image
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle().stroke(Color.black, lineWidth: 4.0))
            .shadow(radius: 7)
            .frame(
                width: 120,
                height: 120,
                alignment: .center)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: Image("main_icon_128"))
    }
}
