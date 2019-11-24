//
//  PopularTrailerCollectionViewCell.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 16.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import UIKit

class PopularTrailerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var trailerIV: UIImageView!
    
    func setPopularTrailerPresentation(popularTrailer : MainPagePopularTrailerPresentation) {
        trailerIV.downloadImage(from: popularTrailer.popularTrailerMovieThumbnail)
    }
    
}
