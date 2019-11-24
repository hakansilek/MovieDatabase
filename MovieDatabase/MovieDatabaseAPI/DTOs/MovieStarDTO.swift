//
//  MovieStarDTO.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 13.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation


public struct MovieStarDTO: Decodable{
    public let id: String
    public let name: String
    public let picture: URL
    
    private enum CodingKeys: String, CodingKey{
        case id = "Id"
        case name = "Name"
        case picture = "Image"
    }
}
