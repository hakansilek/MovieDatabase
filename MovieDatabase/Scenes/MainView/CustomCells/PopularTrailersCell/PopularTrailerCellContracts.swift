//
//  PopularTrailerCellContracts.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 16.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation


protocol PopularTrailerCellProtocol:MainPageCellViewModelProtocol {
    var delegate: PopularTrailerCellDelegate?{get set}
}

enum PopularTrailerCellOutput{
    case setLoading(Bool)
    case setCategoryCellData(MainPagePopularTrailerCellPresentation)
}

protocol PopularTrailerCellDelegate:AnyObject {
     func notifyPopularTrailerCell(_ output: PopularTrailerCellOutput)
}
