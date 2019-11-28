//
//  MovieStarCellContracts.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 13.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation


protocol MovieStarCellViewModelProtocol:MainPageCellViewModelProtocol {
    var delegate: MovieStarCellViewModelDelegate?{get set}
}

enum MovieStarCellOutput {
    case setLoading(Bool)
    case setMovieStarCellData(MainPageMovieStarCellPresentation)
    case error
}

protocol MovieStarCellViewModelDelegate:AnyObject {
    func notifyMovieStarCell(_ output: MovieStarCellOutput)
}
