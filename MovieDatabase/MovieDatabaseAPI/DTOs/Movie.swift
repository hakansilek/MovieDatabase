//
//  MovieResponse.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 5.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation


public struct Movie: Decodable{
    public let id: String
    public let title : String
    public let poster: String
    
    private enum CodingKeys: String, CodingKey{
        case id = "Id"
        case title = "Title"
        case poster = "Poster"
    }
}
