//
//  CategoriesCellContracts.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 8.08.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation


protocol CategoryCellViewModelProtocol: MainPageCellViewModelProtocol{
    var delegate:CategoryCellViewModelDelegate?{get set}
    func didSelect(_ atIndex:IndexPath)
}
enum CategoryCellOutput{
    case setLoading(Bool)
    case setCategoryCellData(MainPageCategoryCellPresentation)
}
enum CategoryCellRouter{
    case detail(Int)
}
protocol CategoryCellViewModelDelegate:AnyObject {
    func notifyCategoryCell(_ output :CategoryCellOutput)
    func navigate(to detailPage :CategoryCellRouter)
}
