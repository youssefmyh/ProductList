//
//  ProductService.swift
//  ProductList
//
//  Created by Youssef Hanna on 4/14/21.
//

import Foundation
import Combine



class ProductService: IProductService {
    
    var productSubject = PassthroughSubject<[FProductListElement], Error>() // subject of Products
    private let apiManager: APIManager = APIManager.shared; // API manager
    
    func fetchProducts() {
        
        let urlString = Configuration.createProductEndpointUrl()
        
        let url = URL(string: urlString)
        
        guard (url != nil) else {
            productSubject.send(completion: .failure(FProductErrors.badURL))
            return
        }
                
        apiManager.fetchItems(url: url!) { [weak self] (result: Result<[FProductListElement], Error>) in
            switch result {
            case .success(let products):
                self?.productSubject.send(products)
            case .failure(let error):
                self?.productSubject.send(completion: .failure(error))
            }
        
    }

    }
    
}
