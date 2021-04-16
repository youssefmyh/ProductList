//
//  APIManager.swift
//  ProductList
//
//  Created by Youssef Hanna on 4/6/21.
//

import Foundation
import Alamofire
import Combine

class APIManager{
  
    static let shared = APIManager() // singleton
    
    private init(){}
    
    var tokens: Set<AnyCancellable> = []
    
    /*
     fetch Genetic Products
     */
    func fetchItems<T: Decodable> (url:URL, completion : @escaping (Result<T,Error>)-> Void){

        
        AF.request(url, method: HTTPMethod.get)
            .publishDecodable(type: T.self)
            .sink(receiveCompletion:
                    { (resultCompletion) in
                        
                        switch resultCompletion {
                            
                        case .finished:
                                break
                            
                        case .failure(let error):
                            completion(.failure(error))
                        }
                        
                    },
                  
                  receiveValue: { (resultArray) in
                    switch resultArray.result {
                    
                    case .success(let data):
                        completion(.success(data))
                        
                    case .failure(let error):
                        completion(.failure(error))
                    
                    }
                  }).store(in: &tokens)

        
        
        
    }
    
}
