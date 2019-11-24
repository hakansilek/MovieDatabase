//
//  MovieStarCellResponse.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 13.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation


public struct MovieStarCellResponse:Decodable{
    public let rowtitle: String
    public let movieStars:[MovieStarDTO]
}
