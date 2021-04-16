//
//  ProductsTableViewModel.swift
//  ProductList
//
//  Created by Youssef Hanna on 4/14/21.
//

import Foundation
import Combine

class ProductsCategoryViewModel {
    
    private var cancellables: Set<AnyCancellable> = []

    var productService:ProductService = ProductService()
   
    var productsViewModels: [ProductsViewModel] = [] //1

    let bindController = PassthroughSubject<Bool, Error>()
    
    init() {
        
        bindProductCategories()
        productService.fetchProducts()
    }

        
    func bindProductCategories(){
    
       productService.productSubject.sink { [weak self] (resultCompletion) in
            
            switch resultCompletion {
            case .finished:
            break
            case .failure( let error):
                self?.bindController.send(completion: .failure(error))
            }
        
        } receiveValue: { [weak self](products) in
          
            
            products.forEach { (FProductListElement) in
                
                let viewModel = ProductsViewModel(products: FProductListElement)
                
                guard viewModel != nil else
                {
                return
                }
                
                self?.productsViewModels.append(viewModel!)
                
            }
            
            self?.bindController.send(true)
          
        }.store(in: &cancellables)
    }
    
    /*
     Get Categories Count
     */
    func getCategoriesCount() -> Int{

        return self.productsViewModels.count
    }
    
    /*
     Product View ModelAt Index
     */
    func getProductViewModelbyIndex(index:Int) -> ProductsViewModel? {
        
        guard productsViewModels.count > index   else { return nil }
                
        return productsViewModels[index]
        
    }
    
    
    
 
    
}

