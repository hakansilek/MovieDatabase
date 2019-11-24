//
//  MovieStarCollectionViewCell.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 13.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import UIKit

class MovieStarCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieStarPicture: UIImageView!
    
    func setMovieStarPresentation(movieStar : MainPageMovieStarPresentation) {
        
        var framePicture = movieStarPicture.frame
        framePicture.size.width = self.frame.size.width
        framePicture.size.height = self.frame.size.height
        
        movieStarPicture.frame = framePicture
        
        movieStarPicture.makeCircleImageView()
        movieStarPicture.downloadImage(from: movieStar.movieStarPoster)
        
    }
}
