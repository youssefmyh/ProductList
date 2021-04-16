//
//  Product.swift
//  FlinkTest
//
//  Created by Youssef Hanna on 4/12/21.
//

import Foundation
struct FProduct : Decodable  {
    let id: String
    let name: String
    let price: FPrice
    let thumbnail: String
    let images: [String]
}
