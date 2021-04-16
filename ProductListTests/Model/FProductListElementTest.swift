//
//  FProductListElementTest.swift
//  ProductListTests
//
//  Created by Youssef Hanna on 4/16/21.
//

import Foundation
import XCTest
class FProductListElementTest : XCTestCase {
    
    private let json = Data("""
      {
          "name": "Netflix & Chill",
          "products": [
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
    ]
    }
    """.utf8)
    
   func test_WhenParseProductListCountShouldbe_G_Zero() throws {
     
    let products = try JSONDecoder().decode(FProductListElement.self, from: json)
    
    XCTAssertTrue(products.products.count > 0 )

   }
    
}
