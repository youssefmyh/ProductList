//
//  FPriceTest.swift
//  ProductListTests
//
//  Created by Youssef Hanna on 4/16/21.
//

import Foundation
import XCTest
class FPriceTest : XCTestCase {
    
    private let json = Data("""
    {
             "currency": "EUR",
             "amount": 5.99
    }
    """.utf8)
    
   func test_WhenParsePriceNumbersCurrencyAndAmountShouldbeCorrect() throws {
     
    let price = try JSONDecoder().decode(FPrice.self, from: json)
    
    XCTAssertEqual(price.currency, "EUR")
    XCTAssertEqual(price.amount, 5.99)

   }
    
}
