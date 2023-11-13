//
//  FoodDTO.swift
//  iOS_app
//
//  Created by Леонид Горохов on 13.11.2023.
//

import Foundation

struct FoodDTO: Decodable {
    let id: Int
    let name: String
    let description: String
    let thumbnail_url: URL
}
