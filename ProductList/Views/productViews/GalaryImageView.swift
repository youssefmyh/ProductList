//
//  GalaryImageView.swift
//  ProductList
//
//  Created by Youssef Hanna on 4/16/21.
//

import Foundation
import UIKit
import Alamofire

class GalaryImageView : UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    
    /*
     Configure Cell with image
     @param url : String
     */
    func configureImage(url:String) {
        
        let url = URL(string: url)
        guard url != nil else {
            return
        }
        
        AF.request( url! ,method: .get).response{ response in

         switch response.result {
          case .success(let responseData):
              self.productImageView.image = UIImage(data: responseData!)

            case .failure(let error):
              print("error--->",error)
          }
      }
    }
    
    
}
