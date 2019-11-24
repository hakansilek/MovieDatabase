//
//  PopularTrailerCellResponse.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 16.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation

public struct PopularTrailerCellResponse: Decodable{
    public let rowtitle: String
    public let trailers: [PopularTrailerDTO]
}
