//
//  CategoryCollectionViewCell.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 6.08.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var posterIV: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    
    
    
    func setMainPageMoviePresentation(movie: MainPageMoviePresentation) {
        titleLbl.text = movie.movieName
        posterIV.downloadImage(from: movie.moviePoster)
    }
}
