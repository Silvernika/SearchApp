//
//  ResponceBody.swift
//  SearchApp
//
//  Created by Nika Pauluchenka on 26.07.24.
//

import Foundation

struct ResponceBody: Codable {
    var photos: [Image]
    var next_page: String
}
