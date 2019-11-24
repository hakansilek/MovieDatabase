//
//  MainPageResponse.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 3.10.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation


public struct MainPageResponse: Decodable{
    public let rows : [RowDTO]
}

