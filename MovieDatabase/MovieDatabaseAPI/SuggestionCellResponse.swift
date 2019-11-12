//
//  SuggestionCellResponse.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 3.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation


public struct SuggestionCellResponse: Decodable{
    public let movie: Movie
    
    public init(from decoder: Decoder) throws{
        let container = try decoder.singleValueContainer()
        movie = try container.decode(Movie.self)
    }
}
