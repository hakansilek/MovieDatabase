//
//  MovieStartableViewCellTableViewCell.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 13.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import UIKit

class MovieStarTableViewCell: UITableViewCell {

    @IBOutlet weak var movieStarCellTitle: UILabel!
    @IBOutlet weak var movieStarCollectionView: UICollectionView!
    
    fileprivate var movieStarCellPresentation: MainPageMovieStarCellPresentation!
    fileprivate var viewModel: MovieStarCellViewModelProtocol!{
        didSet{
            viewModel.delegate = self
            viewModel.load()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .black
        movieStarCollectionView.backgroundColor = .black
    }
    
}

extension MovieStarTableViewCell: MovieStarCellViewModelDelegate{
    func notifyMovieStarCell(_ output: MovieStarCellOutput) {
        switch output {
        case .setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        case .setCategoryCellData(let movieStarCellData):
            movieStarCellPresentation = movieStarCellData
            movieStarCellTitle.text = movieStarCellPresentation.movieStarCellTitle
        }
    }
}
extension MovieStarTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieStarCellPresentation.movieStarCellList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movieStarCell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieStarCell", for: indexPath) as! MovieStarCollectionViewCell
        
        movieStarCell.setMovieStarPresentation(movieStar: movieStarCellPresentation.movieStarCellList[indexPath.row])
        
        return movieStarCell
        
    }
}

extension MovieStarTableViewCell: UICollectionViewDelegate{
    
}
extension MovieStarTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.height-5, height: collectionView.bounds.height-5)
    }
}




extension MovieStarTableViewCell: ConfigurableCell{
    func configure(viewModel: MainPageCellViewModelProtocol) {
        if(self.viewModel == nil){
            self.viewModel = viewModel as? MovieStarCellViewModelProtocol
        }
    }
}
