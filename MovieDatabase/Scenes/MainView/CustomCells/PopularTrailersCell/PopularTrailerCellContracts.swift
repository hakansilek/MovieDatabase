//
//  PopularTrailerCellContracts.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 16.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation


protocol PopularTrailerCellProtocol:MainPageCellViewModelProtocol {
    var delegate: PopularTrailerCellViewModelDelegate?{get set}
}

enum PopularTrailerCellOutput{
    case setLoading(Bool)
    case setPopularTrailerCellData(MainPagePopularTrailerCellPresentation)
    case error
}

protocol PopularTrailerCellViewModelDelegate:AnyObject {
     func notifyPopularTrailerCell(_ output: PopularTrailerCellOutput)
}
