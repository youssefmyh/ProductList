//
//  ProductsViewModel.swift
//  ProductListTests
//
//  Created by Youssef Hanna on 4/16/21.
//

import Foundation
import XCTest
class ProductsViewModelTest : XCTestCase {
       
    
    func testCreateProductsViewModelWithEmptyListShouldReturnNil() throws {
        
        let fProducts = FProductListElement(name: "A", products: [])
        
        let productsViewModels = ProductsViewModel(products: fProducts)
        XCTAssertTrue(productsViewModels == nil)

    }
}
