//
//  JsonService.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 5.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import Foundation


public struct JsonService{
    public static func loadData<T>(_ responseStruct: T.Type, resource name:String) throws ->T where T : Decodable{
        let bundle = Bundle.init(for: MainPageViewModel.self)
        let url = bundle.url(forResource: name, withExtension: "json").unsafelyUnwrapped
        let data = try Data(contentsOf: url)
        let response = try JSONDecoder().decode(responseStruct, from: data)

        return response
    }
}
