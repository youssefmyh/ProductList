//
//  ViewController.swift
//  ProductList
//
//  Created by Youssef Hanna on 4/13/21.
//

import UIKit
import Combine

class ProductCategoryTableController: UIViewController , UITableViewDelegate,UITableViewDataSource{
    
    //----------------------------CONSTANTS---------------------------------------------//
    let MAINTABLEID = "containerTableId"
    let CELLHEIGHT:CGFloat  = 200

    @IBOutlet weak var listTableView: UITableView!
    private var cancellables: Set<AnyCancellable> = []

    private let productCategoryViewModels:ProductsCategoryViewModel = ProductsCategoryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTableViewModel()
        setupTableViews()
    }
    
    /*
     Bind Table with Model
     to be notified when model changed
     **/
    private func bindTableViewModel(){
        
        productCategoryViewModels.bindController.sink { (resultCompletion) in
           
           switch resultCompletion {
           case .finished:
               
           break
           case .failure( let error):
            
            print(error.localizedDescription)
           }
       
       } receiveValue: { (products) in
        self.listTableView.reloadData()
         
       }.store(in: &cancellables)
       

    }
    
    /*
     Setup table view
     register the table Cell
     */
    private func setupTableViews(){
        listTableView.register(ProductsUITableViewCell.self, forCellReuseIdentifier: MAINTABLEID)
        listTableView.separatorStyle = .singleLine
        
    }
    
    // Number of Rows in table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return productCategoryViewModels.getCategoriesCount()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MAINTABLEID, for: indexPath) as! ProductsUITableViewCell
        cell.productsViewModel = productCategoryViewModels.getProductViewModelbyIndex(index: indexPath.row)
        cell.tableController = self
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CELLHEIGHT
    }
 
    
    
    
}

