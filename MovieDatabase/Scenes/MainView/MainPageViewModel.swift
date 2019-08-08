//
//  MainPageViewModel.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 6.08.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation

final class MainPageViewModel: MainPageViewModelProtocol {
    weak var delegate: MainPageViewModelDelegate?

    func load() {
        delegate?.notifyViewController(.setLoading(true))
        delegate?.notifyViewController(.setLoading(false))
    }
    
}
