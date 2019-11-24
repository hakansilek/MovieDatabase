//
//  SuggestionCellViewModel.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 3.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation


final class SuggestionCellViewModel: SuggestionCellViewModelProtocol{
   
    internal weak var delegate: SuggestionCellViewModelDelegate?
    private var suggestionCellMoviePresentation:MainPageMoviePresentation!
    internal var dataId: String
    
    init(dataId:String) {
        self.dataId = dataId
    }
    
    func load(){
        delegate?.notifySuggestionCell(.setLoading(true))
        do{
            try loadData()
            delegate?.notifySuggestionCell(.setSuggestionCellData(suggestionCellMoviePresentation))
        }catch{
            print("SuggestionCell Error")
        }
        delegate?.notifySuggestionCell(.setLoading(false))
    }
    
    private func loadData() throws{
        let suggestionCellResponse = try JsonService.loadData(SuggestionCellResponse.self, resource: dataId)
        let responseMovie = suggestionCellResponse.movie
        
        suggestionCellMoviePresentation = MainPageMoviePresentation(movieId: responseMovie.id, movieName: responseMovie.title, moviePoster: responseMovie.poster)
        
       
    }
    
    
}
