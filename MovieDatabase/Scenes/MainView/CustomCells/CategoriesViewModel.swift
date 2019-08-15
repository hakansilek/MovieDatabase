//
//  CategoriesViewModel.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 8.08.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation

final class CategoriesCellViewModel: CategoriesCellViewModelProtocol {
    
    var cellHeight: Int
    init(cellHeight:Int) {
        self.cellHeight = cellHeight
    }

    weak var delegate: CategoriesCellViewModelDelegate?
    
    func didSelect(_ atIndex: IndexPath) {
        delegate?.navigate(to: .detail(atIndex.item))
    }
    
    
}
