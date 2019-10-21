//
//  Movie.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 3.10.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation


public struct MovieDTO: Decodable{
    
    public let Id: String
    public let Title: String
    public let Poster: String
}
