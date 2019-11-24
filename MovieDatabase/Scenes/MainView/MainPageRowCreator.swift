//
//  RowCreator.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 3.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation

typealias SuggestionCellConfig = TableCellConfigurator<SuggestionTableViewCell>
typealias CategoryCellConfig = TableCellConfigurator<CategoryTableViewCell>
typealias MovieStarCellConfig = TableCellConfigurator<MovieStarTableViewCell>
typealias PopularTrailerCellConfig = TableCellConfigurator<PopularTrailerTableViewCell>

enum CellTypes:String {
    case suggestion = "suggestion"
    case category = "category"
    case movieStar = "moviestar"
    case popularTrailer = "populartrailer"
}

struct MainPageRowCreator {
    static let shared = MainPageRowCreator()
    private init(){}
    func getCellType(rows: [RowDTO]) -> [CellConfigurator] {
        var mainPageRows :[CellConfigurator] = []
        for row in rows{
            let cellType = CellTypes.init(rawValue:row.rowType)
            var obj:CellConfigurator
            let dataId = row.dataId
            switch cellType {
            case .suggestion:
                obj = SuggestionCellConfig.init(viewModel: SuggestionCellViewModel(dataId: dataId), cellHeight: 600)
            case .category:
                obj = CategoryCellConfig.init(viewModel: CategoryCellViewModel(dataId: dataId), cellHeight: 250)
            case .movieStar:
                obj = MovieStarCellConfig.init(viewModel: MovieStarCellViewModel(dataId: dataId), cellHeight: 120)
            case .popularTrailer:
                obj = PopularTrailerCellConfig.init(viewModel: PopularTrailerCellViewModel(dataId: dataId), cellHeight: 200)
            case .none:
                obj = CategoryCellConfig.init(viewModel: CategoryCellViewModel(dataId: dataId), cellHeight: 250)
            }
            mainPageRows.append(obj)
        }
        
        return mainPageRows
    }
}
