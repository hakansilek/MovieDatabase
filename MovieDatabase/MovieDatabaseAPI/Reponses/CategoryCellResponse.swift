//
//  CategoryCellResponse.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 5.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation


public struct CategoryCellResponse: Decodable{
    public let rowtitle: String
    public let columns: [MovieDTO]
}
