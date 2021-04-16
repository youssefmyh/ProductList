//
//  FProductViewModel.swift
//  ProductList
//
//  Created by Youssef Hanna on 4/14/21.
//

import Foundation
class ProductViewModel {
    
    let product:FProduct!

    init?(product:FProduct){
        
        guard product.id.count > 0 else{
            return nil
        }
        
        self.product = product
    }
    
    
}
