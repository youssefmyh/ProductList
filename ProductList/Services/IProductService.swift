//
//  IProductService.swift
//  ProductList
//
//  Created by Youssef Hanna on 4/14/21.
//

import Foundation

enum FProductErrors: Error {
  case badURL
  case invalidResponse
  case noData
  case failedRequest
  case invalidData
}
protocol IProductService {
    func fetchProducts() -> Void
}
