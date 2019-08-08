//
//  CategoriesCellContracts.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 8.08.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation


protocol CategoriesCellViewModelProtocol{
    var delegate:CategoriesCellViewModelDelegate?{get set}
    func didSelect(_ atIndex:IndexPath)
}
enum CategoriesCellRouter{
    case detail(Int)
}
protocol CategoriesCellViewModelDelegate:AnyObject {
    func navigate(to detailPage:CategoriesCellRouter)
}
