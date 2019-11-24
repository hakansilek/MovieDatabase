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

    var rows :[CellConfigurator] = []
    
    func load(){
        delegate?.notifyViewController(.setLoading(true))
        do {
            try loadData()
            delegate?.notifyViewController(.setList(rows))
        } catch  {
            print("MainPage Cell")
        }
        delegate?.notifyViewController(.setLoading(false))
        
    }
    private func loadData() throws{
        let mainPageResponse = try JsonService.loadData(MainPageResponse.self, resource: "rows")
        rows = MainPageRowCreator.shared.getCellType(rows: mainPageResponse.rows)
    }
    
}


