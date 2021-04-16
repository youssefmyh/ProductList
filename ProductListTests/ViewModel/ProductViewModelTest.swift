//
//  ProductViewModel.swift
//  ProductListTests
//
//  Created by Youssef Hanna on 4/16/21.
//

import Foundation
import XCTest

class ProductViewModelTest : XCTestCase{
    
    func testCreateProductViewModelShouldHaveModelData() throws {
      
    let product = FProduct(id: "A1", name: "Hi", price: FPrice(currency: "EUR", amount: 1.5), thumbnail: "thu", images: ["url"])
    
    let productViewModel = ProductViewModel(product: product)
        XCTAssertTrue(productViewModel != nil)
        XCTAssertTrue(productViewModel?.product.id == "A1")

    }
    
    
    
    func testCreateViewModelWithEmptyIdShouldReturnNil() throws {
      
    let product = FProduct(id: "", name: "Hi", price: FPrice(currency: "EUR", amount: 1.5), thumbnail: "thu", images: ["url"])
    
    let productViewModel = ProductViewModel(product: product)
        XCTAssertTrue(productViewModel == nil)

    }
}
