//
//  FProductSectionViewModel.swift
//  ProductList
//
//  Created by Youssef Hanna on 4/14/21.
//

import Foundation

class ProductsViewModel {
    
    var productListElement: FProductListElement!
    
    var productViewModels: [ProductViewModel] = [] //1

    
    init?(products:FProductListElement){
        
        guard products.products.count > 0 else {
            return nil
        }
        
        self.productListElement = products
        self.productListElement.products.forEach { (FProduct) in
            
            let productViewModel = ProductViewModel(product: FProduct)
            guard productViewModel != nil else { return}
            productViewModels.append(productViewModel!)
        }
        
    }
    
    func productsViewModelAtIndex(index:Int) -> ProductViewModel? {
        
        guard productViewModels.count > index  else { return nil }
        
        return productViewModels[index]
        
    }
    
    
    
}
