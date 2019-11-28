//
//  MainPageRowErrorView.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 28.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import UIKit

class MainPageRowErrorView: UIView {    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        let errorView = UIView(frame: CGRect.zero)
        let errorViewTitle = UILabel(frame: CGRect.zero)
        let errorViewMessage = UILabel(frame: CGRect.zero)
        
        errorView.translatesAutoresizingMaskIntoConstraints = false
        errorViewTitle.translatesAutoresizingMaskIntoConstraints = false
        errorViewMessage.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.addSubview(errorView)
        let errorViewConstraints = [
            errorView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            errorView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            errorView.widthAnchor.constraint(equalTo: self.widthAnchor),
            errorView.heightAnchor.constraint(equalTo: self.heightAnchor)
        ]
        NSLayoutConstraint.activate(errorViewConstraints)
        
        errorViewTitle.text = "Oopps.."
        errorViewTitle.textAlignment = .center
        errorViewTitle.numberOfLines = 0
        errorViewTitle.font = UIFont.boldSystemFont(ofSize: 25)
        errorViewTitle.textColor = .white
        errorView.addSubview(errorViewTitle)
        let errorViewTitleConstraints = [
            errorViewTitle.centerXAnchor.constraint(equalTo: errorView.centerXAnchor),
            errorViewTitle.widthAnchor.constraint(equalTo: errorView.widthAnchor),
            errorViewTitle.topAnchor.constraint(equalTo: errorView.topAnchor, constant: 10)
        ]
        NSLayoutConstraint.activate(errorViewTitleConstraints)
        
        errorViewMessage.text = "An error occured during the operation.."
        errorViewMessage.textAlignment = .center
        errorViewMessage.font = UIFont.systemFont(ofSize: 20)
        errorViewMessage.textColor = .white
        errorViewMessage.numberOfLines = 0
        errorView.addSubview(errorViewMessage)
        let errorViewMessageConstraints = [
            errorViewMessage.centerXAnchor.constraint(equalTo: errorView.centerXAnchor),
            errorViewMessage.centerYAnchor.constraint(equalTo: errorView.centerYAnchor),
            
            errorViewMessage.widthAnchor.constraint(equalTo: errorView.widthAnchor),
        ]
        NSLayoutConstraint.activate(errorViewMessageConstraints)
    }
    
}
