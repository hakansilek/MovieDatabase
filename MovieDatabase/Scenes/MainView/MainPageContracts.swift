//
//  MainPageContracts.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 8.08.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation


protocol MainPageViewModelProtocol {
    var delegate:MainPageViewModelDelegate?{set get}
    func load()
}

enum MainPageDelegationType {
    case setLoading(Bool)
    case setList([CellConfigurator])
}

protocol MainPageViewModelDelegate:AnyObject {
    func notifyViewController(_ output: MainPageDelegationType)
}
