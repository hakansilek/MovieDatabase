//
//  PopularTrailerCellViewModel.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 16.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation


final class PopularTrailerCellViewModel: PopularTrailerCellProtocol{
    weak var delegate: PopularTrailerCellViewModelDelegate?
    
    private var popularTrailerCellPresentation: MainPagePopularTrailerCellPresentation!
    
    let dataId: String
    init(dataId:String) {
        self.dataId = dataId
    }
    func load() {
        delegate?.notifyPopularTrailerCell(.setLoading(true))
        do{
            try loadData()
            delegate?.notifyPopularTrailerCell(.setPopularTrailerCellData(popularTrailerCellPresentation))
        }catch{
            delegate?.notifyPopularTrailerCell(.error)
        }
        delegate?.notifyPopularTrailerCell(.setLoading(false))
    }
    
    private func loadData() throws{
        let popularTrailerCellResponse = try JsonService.loadData(PopularTrailerCellResponse.self, resource: dataId)
        
        let popularTrailerCellTitle = popularTrailerCellResponse.rowtitle
        
        let popularTrailerCellList = popularTrailerCellResponse.trailers.map({MainPagePopularTrailerPresentation(popularTrailerMovieName: $0.title, popularTrailerMovieThumbnail: $0.thumbnail)})
               
               popularTrailerCellPresentation = MainPagePopularTrailerCellPresentation(popularTrailerCellTitle: popularTrailerCellTitle, popularTrailerCellList: popularTrailerCellList)
        
    }
    
    
}
