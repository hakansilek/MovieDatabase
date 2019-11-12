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

enum CellTypes:String {
       case suggestion = "suggestion"
       case category = "category"
}

struct MainPageRowCreator {
    static let shared = MainPageRowCreator()
    private init(){}
    func getCellType(rows: [Row]) -> [CellConfigurator] {
        var mainPageRows :[CellConfigurator] = []
        for row in rows{
            let cellType = CellTypes.init(rawValue:row.rowType)
            var obj:CellConfigurator
            switch cellType {
            case .suggestion:
                obj = SuggestionCellConfig.init(viewModel: SuggestionCellViewModel(dataId: row.dataId), cellHeight: 700)
            case .category:
                obj = CategoryCellConfig.init(viewModel: CategoryCellViewModel(dataId: row.dataId), cellHeight: 250)
            case .none:
                obj = CategoryCellConfig.init(viewModel: CategoryCellViewModel(dataId: row.dataId), cellHeight: 250)
            }
            mainPageRows.append(obj)
        }
        
        return mainPageRows
    }
}
