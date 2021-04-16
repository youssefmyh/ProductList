//
//  Configuration.swift
//  ProductList
//
//  Created by Youssef Hanna on 4/14/21.
//

import Foundation



// Configuration 
struct Configuration {
    
    static let apiHost:String = "https://run.mocky.io/v3/7511a232-ae16-4478-9b83-44915f43101d"
    
    static func createProductEndpointUrl() ->String{
        return "\(apiHost)"

    }
}
