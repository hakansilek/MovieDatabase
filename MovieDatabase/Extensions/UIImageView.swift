//
//  UIImageView+DownloadImage.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 24.09.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import UIKit


extension UIImageView{
    func downloadImage(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFill) {
        let activityIndicatorView =  UIActivityIndicatorView()
        activityIndicatorView.center = self.center
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.style = .whiteLarge
        self.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let imageData = data else{return}
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                activityIndicatorView.stopAnimating()
                self.image = image
                self.contentMode = mode
            }
        }.resume()
    }
    
    func makeCircleImageView() {
        self.layer.masksToBounds=true
        self.layer.cornerRadius = self.frame.height / 2
    }
}
