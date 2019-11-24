//
//  PopularTrailerDTO.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 16.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation

public struct PopularTrailerDTO:Decodable{
    public let id:String
    public let title:String
    public let thumbnail:URL
    
    
    private enum CodingKeys: String, CodingKey{
        case id = "Id"
        case title = "Title"
        case thumbnail = "Thumbnail"
    }
}
