//
//  MainPageResponse.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 3.10.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation


public struct MainPageResponse: Decodable{
    
    public let rows : [Rows]
    
}

public struct Rows:Decodable{
    public let rowtitle : String
    public let columns : [MovieDTO]
}
