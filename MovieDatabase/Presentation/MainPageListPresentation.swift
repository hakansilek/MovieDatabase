//
//  MainPageListPresentation.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 6.10.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation


struct MainPageListPresentation{
    let rowTitle:String
    let movies: [MainPageMoviePresentation]
    init(rows: Rows) {
        rowTitle = rows.rowtitle
        movies = rows.columns.map({MainPageMoviePresentation(movieDTO: $0)})
        
    }
}
