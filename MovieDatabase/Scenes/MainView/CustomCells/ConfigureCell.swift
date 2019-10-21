//
//  ConfigureCell.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 19.08.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import UIKit


protocol ConfigurableCell{
    associatedtype DataType
    func configure(data: DataType, viewModel: CategoriesCellViewModelProtocol)
}

protocol CellConfigurator {
    static var reuseId:String {get}
    var cellHeigth:Double{get}
    func configure(cell: UIView)
}

class TableCellConfigurator<CellType: ConfigurableCell, DataType>: CellConfigurator where CellType.DataType == DataType {
    var cellHeigth: Double
    
    static var reuseId: String { return String(describing: CellType.self)}
    
    let item: DataType
    let viewModel: CategoriesCellViewModelProtocol
    init(item:DataType, viewModel: CategoriesCellViewModelProtocol) {
        self.item = item
        self.viewModel = viewModel
        self.cellHeigth = viewModel.cellHeight
    }
    
    func configure(cell: UIView) {
        (cell as! CellType).configure(data: item, viewModel: viewModel)
    }
}
