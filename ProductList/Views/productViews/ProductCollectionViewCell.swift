//
//  FProductView.swift
//  ProductList
//
//  Created by Youssef Hanna on 4/14/21.
//

import Foundation
import UIKit
import Alamofire
class ProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    /*
     Configure With View Model
     @param modelView:ProductViewModel
     */
    func configureWithModelView(modelView:ProductViewModel) {
        productName.text = modelView.product.name
        productName?.contentMode = .scaleAspectFit

        productName.clipsToBounds = true


        AF.request( modelView.product.thumbnail ,method: .get).response{ response in

         switch response.result {
          case .success(let responseData):
              self.productImage.image = UIImage(data: responseData!)

            case .failure(let error):
              print("error--->",error)
          }
      }
    }
    
    
    @IBAction func addItemToBasket(_ sender: Any) {
        
    }
    
    
}

