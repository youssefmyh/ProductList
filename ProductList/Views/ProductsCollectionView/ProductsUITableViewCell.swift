//
//  ProductsUITableViewCell.swift
//  ProductList
//
//  Created by Youssef Hanna on 4/14/21.
//

import Foundation
import UIKit

class ProductsUITableViewCell: UITableViewCell {
    
    var productsViewModel:ProductsViewModel?
    
    var headerLabel: UILabel = {
        let label = UILabel()
        return label;
    }()

    
   override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .lightGray
        addSubview(headerLabel)
        headerLabel.anchor(top: topAnchor, paddingTop: 5, bottom: nil, paddingBottom: 0, left: leftAnchor, paddingLeft: 10, right: nil, paddingRight: 0, width: 0, height: 0)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
     tableController to by synced with the product Category 
     */
    weak var tableController : ProductCategoryTableController? {
            
        didSet {
            configureProductsViews()
        }
        
    }
    
    /*
     Configure Horizontal Views Configuration
     */
    private func configureProductsViews(){
        

        guard let containerController = tableController else { return }
        self.headerLabel.text = self.productsViewModel?.productListElement.name

        let flowlayout = UICollectionViewFlowLayout()
        let contentCollection = ProductsController(collectionViewLayout: flowlayout)
        contentCollection.productsViewModel = self.productsViewModel
        flowlayout.scrollDirection = .horizontal
        
        containerController.addChild(contentCollection)
        addSubview(contentCollection.view)
        contentCollection.didMove(toParent: containerController)
        contentCollection.view.anchor(top: headerLabel.bottomAnchor, paddingTop: 5, bottom: bottomAnchor, paddingBottom: 0, left: leftAnchor, paddingLeft: 0, right: rightAnchor, paddingRight: 0, width: 0, height: 0)

        
    }
    

    
}
