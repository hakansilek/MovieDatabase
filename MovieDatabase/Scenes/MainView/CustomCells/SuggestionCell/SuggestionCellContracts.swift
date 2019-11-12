//
//  SuggestionCellContracts.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 3.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation


protocol SuggestionCellViewModelProtocol: MainPageCellViewModelProtocol {
    var delegate: SuggestionCellViewModelDelegate?{get set}
}

enum SuggestionCellOutputType{
    case setLoading(Bool)
    case setSuggestionCellData(MainPageMoviePresentation)
}

enum SuggestionCellRouter{
    case detail
}

protocol SuggestionCellViewModelDelegate:AnyObject{
    func notifySuggestionCell(_ output: SuggestionCellOutputType)
    func navigate(to detailPage :SuggestionCellRouter)
}
