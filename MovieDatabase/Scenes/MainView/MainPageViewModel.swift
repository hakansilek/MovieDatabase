//
//  MainPageViewModel.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 6.08.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation

typealias SuggestionCellConfig = TableCellConfigurator<SuggestionTableViewCell, MovieOfDay>
typealias C1 = TableCellConfigurator<CategoriesTableViewCell, MainPageListPresentation>

final class MainPageViewModel: MainPageViewModelProtocol {
    weak var delegate: MainPageViewModelDelegate?
    

    
    var rows :[CellConfigurator] = [
        SuggestionCellConfig.init(item: MovieOfDay(), viewModel: CategoriesCellViewModel(cellHeight: 300))
    ]
    
    func load(){
        delegate?.notifyViewController(.setLoading(true))
        do {
            try loadData()
        } catch  {
            print("HATA")
        }
        
        
        delegate?.notifyViewController(.setLoading(false))
        delegate?.notifyViewController(.setList(rows))
    }
    func loadData() throws{
        let bundle = Bundle.init(for: MainPageViewModel.self)
        let url = bundle.url(forResource: "movies", withExtension: "json").unsafelyUnwrapped
        let data = try Data(contentsOf: url)
        let mainPageResponse = try JSONDecoder().decode(MainPageResponse.self, from: data)

        let items = mainPageResponse.rows.map({MainPageListPresentation(rows: $0)})
        for item in items{
            rows.append(C1.init(item: item, viewModel: CategoriesCellViewModel(cellHeight: 200)))
        }
        
        
        
        
    }
    
}
