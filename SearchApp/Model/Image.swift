//
//  Image.swift
//  SearchApp
//
//  Created by Nika Pauluchenka on 25.07.24.
//

import Foundation

struct Image: Codable, Identifiable{
    var id: Int
    var url: String
    var alt: String
    var src: ImageSrc
    
}
