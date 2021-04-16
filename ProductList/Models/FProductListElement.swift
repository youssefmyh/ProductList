//
//  ProductListElement.swift
//  FlinkTest
//
//  Created by Youssef Hanna on 4/12/21.
//

import Foundation

struct FProductListElement : Decodable {
    let name: String
    let products: [FProduct]
}
