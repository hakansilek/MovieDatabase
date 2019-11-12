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
    @IBOutlet weak var suggestionMovieTitle: UILabel!
    
    var viewModel: SuggestionCellViewModel!{
        didSet{
            viewModel.delegate = self
        }
    }
    
}

extension SuggestionTableViewCell: SuggestionCellViewModelDelegate{
    func notifySuggestionCell(_ output: SuggestionCellOutputType) {
        switch output {
        case .setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        case .setSuggestionCellData(let suggestionCellData):
            suggestionMovieTitle.text = suggestionCellData.movieName
            suggestionMoviePoster.downloadImage(from: suggestionCellData.moviePoster)
            suggestionMoviePoster.addInnerShadow()
        }
    }
    
    func navigate(to detailPage: SuggestionCellRouter) {
        
    }
}

extension SuggestionTableViewCell: ConfigurableCell{
    func configure(viewModel: MainPageCellViewModelProtocol) {
        self.viewModel = viewModel as? SuggestionCellViewModel
        viewModel.load()
    }
}

extension UIView {
    public func addInnerShadow(topColor: UIColor = UIColor.black.withAlphaComponent(1)) {
        let shadowLayer = CAGradientLayer()
        shadowLayer.cornerRadius = layer.cornerRadius
        shadowLayer.frame = bounds
        shadowLayer.frame.size.height = 100.0
        shadowLayer.colors = [
            topColor.cgColor,
            UIColor.black.withAlphaComponent(0).cgColor
        ]
        layer.addSublayer(shadowLayer)
    }
}
