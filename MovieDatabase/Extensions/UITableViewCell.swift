//
//  UITableViewCell.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 28.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import UIKit


extension UITableViewCell{
    func addErrorMessageView() {
        let errorView = MainPageRowErrorView(frame: self.frame)
        self.addSubview(errorView)
        errorView.translatesAutoresizingMaskIntoConstraints = false
        errorView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive=true
        errorView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive=true
        
        errorView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive=true
        errorView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive=true
    }
}
