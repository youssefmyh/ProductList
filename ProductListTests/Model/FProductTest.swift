//
//  FProductTest.swift
//  ProductListTests
//
//  Created by Youssef Hanna on 4/16/21.
//

import Foundation
import XCTest

class FProductTest : XCTestCase {
    
    private let json = Data("""
        {
           "id": "UHJvZHVjdDoyOTQ4",
           "name": "Häagen Dazs Cookies&Cream 460ML",
           "price": {
             "currency": "EUR",
             "amount": 5.99
           },
           "thumbnail": "https://storage.googleapis.com/flink-media/products_300/1010987-1.png",
           "images": [
             "https://storage.googleapis.com/flink-media/products_300/1010987-1.png",
             "https://storage.googleapis.com/flink-media/products_300/1010987-2.png",
             "https://storage.googleapis.com/flink-media/products_300/1010987-3.png",
             "https://storage.googleapis.com/flink-media/products_300/1010987-4.png"
           ]
         }
    """.utf8)
    
   func test_WhenParseProductID_Name_SHouldbeCorrect() throws {
     
    let price = try JSONDecoder().decode(FProduct.self, from: json)
    
    XCTAssertEqual(price.id, "UHJvZHVjdDoyOTQ4")
    XCTAssertEqual(price.name, "Häagen Dazs Cookies&Cream 460ML")

   }
    
}
