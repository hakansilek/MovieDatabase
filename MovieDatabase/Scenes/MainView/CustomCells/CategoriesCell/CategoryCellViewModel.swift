//
//  CategoriesViewModel.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 8.08.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation

final class CategoryCellViewModel:  CategoryCellViewModelProtocol {
    
    
    internal weak var delegate: CategoryCellViewModelDelegate?
    private var categoryCellPresentation: MainPageCategoryCellPresentation!
    var dataId: String
    init(dataId:String) {
        self.dataId = dataId
    }
    func didSelect(_ atIndex: IndexPath) {
        delegate?.navigate(to: .detail(atIndex.item))
    }
    
    func load() {
        delegate?.notifyCategoryCell(.setLoading(true))
        do{
            try loadData()
            delegate?.notifyCategoryCell(.setCategoryCellData(categoryCellPresentation))
        }catch{
            print("CategoryCell Error")
        }
         delegate?.notifyCategoryCell(.setLoading(false))
        
    }
    
    func loadData() throws{
          let categoryCellResponse = try JsonService.loadData(CategoryCellResponse.self, resource: dataId)
        
        let categoryCellTitle = categoryCellResponse.rowtitle
        let categoryCellMovies = categoryCellResponse.columns.map({MainPageMoviePresentation(movieId: $0.id, movieName: $0.title, moviePoster: $0.poster)})
        
        categoryCellPresentation = MainPageCategoryCellPresentation(categoryCellTitle: categoryCellTitle, categoryCellMovies: categoryCellMovies)
    }
    
    
    
    
}
