//
//  HorizontalViewsController.swift
//  ProductList
//
//  Created by Youssef Hanna on 4/15/21.
//

import Foundation
import UIKit

class ProductsController: UICollectionViewController , UICollectionViewDelegateFlowLayout {
    
    //-------------------------------------Constants-----------------------------------------------------//
    let PRODUCTCELLWIDTH:CGFloat = 100
    let PRODUCTCELLPADDING:CGFloat = 10
    let PRODUCTCELLID = "ProductCellID"
    let PRODUCTCELLREUSEID = "ProductCell"
    let PRODUCTDETAILVIEWCONTROLLER = "ProductCollectionViewCell"
    let VIEWNIBFILE = "ProductCollectionViewCell"

    //-------------------------------------ViewModel-----------------------------------------------------//

    var productsViewModel:ProductsViewModel?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    /*
     Setup Collection Views
     */
    func setupCollectionView() {
        
        collectionView?.showsHorizontalScrollIndicator = false
        collectionView?.backgroundColor = .lightGray
        let nib = UINib(nibName: VIEWNIBFILE, bundle: nil)
        collectionView?.register(nib, forCellWithReuseIdentifier: PRODUCTCELLID)

    }
    
}


extension ProductsController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if ((productsViewModel?.productListElement) != nil) {
            return productsViewModel!.productListElement.products.count
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PRODUCTCELLID, for: indexPath) as! ProductCollectionViewCell
        
        let productModel = (productsViewModel?.productsViewModelAtIndex(index: indexPath.row))
        guard productModel != nil else {
            return cell
        }
        cell.configureWithModelView(modelView: productModel!)
        cell.backgroundColor = .white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: PRODUCTCELLWIDTH, height: view.frame.height-PRODUCTCELLPADDING)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: PRODUCTCELLPADDING, bottom: 0, right: PRODUCTCELLPADDING)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let productDetailsViewController:ProductDetailsViewController = self.navigationController?.storyboard?.instantiateViewController(identifier: "ProductDetailsViewController") as! ProductDetailsViewController
        productDetailsViewController.productModelView = (productsViewModel?.productsViewModelAtIndex(index: indexPath.row))
        
        self.navigationController?.pushViewController(productDetailsViewController, animated: true)
    }
    
}
