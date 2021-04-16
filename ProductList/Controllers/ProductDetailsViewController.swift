//
//  DetailsViewController.swift
//  ProductList
//
//  Created by Youssef Hanna on 4/15/21.
//

import Foundation
import UIKit
import Alamofire
class ProductDetailsViewController : UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
   
    let PRODUCTCELLID = "ProductCellID"
    let VIEWNIBFILE = "GalaryImageView"
    let PRODUCTCELLWIDTH:CGFloat = 100
    let PRODUCTCELLPADDING:CGFloat = 10
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!

    var productModelView:ProductViewModel?

    @IBOutlet weak var imagesCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        
        productLabel.text = productModelView?.product.name
        setupCollectionView()
    }

    /*
     Setup Collection Views
     */
    func setupCollectionView() {
        
        imagesCollectionView?.showsHorizontalScrollIndicator = false
        imagesCollectionView?.backgroundColor = .white
        let nib = UINib(nibName: VIEWNIBFILE, bundle: nil)
        imagesCollectionView?.register(nib, forCellWithReuseIdentifier: PRODUCTCELLID)
        imagesCollectionView.delegate = self
        imagesCollectionView.dataSource = self
        
    }


}


extension ProductDetailsViewController {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (productModelView?.product.images.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: imagesCollectionView.frame.width, height: imagesCollectionView.frame.height)
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:GalaryImageView = collectionView.dequeueReusableCell(withReuseIdentifier: PRODUCTCELLID, for: indexPath) as! GalaryImageView
        cell.configureImage(url: (productModelView?.product.images[indexPath.row])!)
        return cell
    }
    
    
}
