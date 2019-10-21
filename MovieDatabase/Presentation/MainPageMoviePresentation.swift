//
//  Movie.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 15.08.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation


struct MainPageMoviePresentation {
    let movieId:String
    let movieName:String
    let moviePoster:String
//    let movieYear: String
//    let movieFragman:String
    
    init(movieDTO: MovieDTO) {
        movieName = movieDTO.Title
        moviePoster = movieDTO.Poster
        movieId = movieDTO.Id
    }
}
