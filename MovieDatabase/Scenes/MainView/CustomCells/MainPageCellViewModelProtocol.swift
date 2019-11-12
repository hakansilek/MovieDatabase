//
//  MainPageCellContracts.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 3.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation


protocol MainPageCellViewModelProtocol {
    var dataId:String { get }
    func load()
}
