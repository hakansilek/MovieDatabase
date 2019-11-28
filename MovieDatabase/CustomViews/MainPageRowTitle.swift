//
//  MainPageTitle.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 16.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import UIKit

class MainPageRowTitle: UILabel {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.textColor = .white
        self.font = UIFont.init(name: "Menlo-Bold", size: 14)
    }
    
}
