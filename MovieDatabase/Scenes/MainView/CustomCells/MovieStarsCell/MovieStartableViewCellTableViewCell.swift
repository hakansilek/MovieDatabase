//
//  MovieStartableViewCellTableViewCell.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 13.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import UIKit

class MovieStarTableViewCellTableViewCell: UITableViewCell {

    
    
    var viewModel: MovieStarCellViewModelProtocol!{
        didSet{
            viewModel.delegate = self
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewModel.load()
    }
}


extension MovieStarTableViewCellTableViewCell: MovieStarCellViewModelDelegate{
    func notifyMovieStarCell(_ output: MovieStarCellOutput) {
        switch output {
        case .setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        }
    }
}

extension MovieStarTableViewCellTableViewCell: ConfigurableCell{
    func configure(viewModel: MainPageCellViewModelProtocol) {
        if(self.viewModel == nil){
            self.viewModel = viewModel as? MovieStarCellViewModelProtocol
        }
    }
}
