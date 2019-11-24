//
//  SuggestionTableViewCell.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 17.08.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import UIKit

class SuggestionTableViewCell: UITableViewCell {

    @IBOutlet weak var suggestionMoviePoster: UIImageView!
    
    var viewModel: SuggestionCellViewModel!{
        didSet{
            viewModel.delegate = self
            viewModel.load()
        }
    }
    
}

extension SuggestionTableViewCell: SuggestionCellViewModelDelegate{
    func notifySuggestionCell(_ output: SuggestionCellOutput) {
        switch output {
        case .setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        case .setSuggestionCellData(let suggestionCellData):
            suggestionMoviePoster.downloadImage(from: suggestionCellData.moviePoster)
        }
    }
    
    func navigate(to detailPage: SuggestionCellRouter) {
        
    }
}

extension SuggestionTableViewCell: ConfigurableCell{
    func configure(viewModel: MainPageCellViewModelProtocol) {
        if(self.viewModel == nil){
            self.viewModel = viewModel as? SuggestionCellViewModel
        }
    }
}
