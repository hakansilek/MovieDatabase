//
//  ConfigureCell.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 19.08.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import UIKit


protocol ConfigurableCell{
    func configure(viewModel: MainPageCellViewModelProtocol)
}

protocol CellConfigurator {
    static var reuseId:String {get}
    var cellHeigth:Double{get}
    func configure(cell: UIView)
}

class TableCellConfigurator<CellType: ConfigurableCell>: CellConfigurator{
    var cellHeigth: Double
    
    static var reuseId: String { return String(describing: CellType.self)}
    
    let viewModel: MainPageCellViewModelProtocol
    init( viewModel: MainPageCellViewModelProtocol, cellHeight: Double) {
        self.viewModel = viewModel
        self.cellHeigth = cellHeight
    }
    
    func configure(cell: UIView) {
        (cell as! CellType).configure(viewModel: viewModel)
    }
}
