//
//  Hobby.swift
//  LB7
//
//  Created by AdminUser on 15.04.21.
//

import Foundation
import SwiftUI

struct Hobby: Hashable, Codable, Identifiable {
    
    var id: Int
    var name: String
    var description: String
    var site: String
    var type: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
