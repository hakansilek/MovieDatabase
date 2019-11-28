//
//  MovieStarCellViewModel.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 13.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation


final class MovieStarCellViewModel: MovieStarCellViewModelProtocol {
    weak var delegate: MovieStarCellViewModelDelegate?
    
    let dataId: String
    private var movieStarCellPresentation: MainPageMovieStarCellPresentation!
    
    init(dataId:String) {
           self.dataId = dataId
       }
    func load() {
        delegate?.notifyMovieStarCell(.setLoading(true))
        do{
            try loadData()
            delegate?.notifyMovieStarCell(.setMovieStarCellData(movieStarCellPresentation))
        }catch{
            delegate?.notifyMovieStarCell(.error)
        }
        delegate?.notifyMovieStarCell(.setLoading(false))
        
    }
    
    private func loadData() throws{
        let movieStarCellResponse = try JsonService.loadData(MovieStarCellResponse.self, resource: dataId)
        
        let movieStarCellTitle = movieStarCellResponse.rowtitle
        
        let movieStarCellList = movieStarCellResponse.movieStars.map({MainPageMovieStarPresentation(movieStarName: $0.name, movieStarPoster: $0.picture)})
        
        movieStarCellPresentation = MainPageMovieStarCellPresentation(movieStarCellTitle: movieStarCellTitle, movieStarCellList: movieStarCellList)
    }
    
    
}
