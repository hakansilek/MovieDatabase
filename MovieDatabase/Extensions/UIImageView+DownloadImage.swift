//
//  UIImageView+DownloadImage.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 24.09.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import UIKit


extension UIImageView{
    func downloadImage(from urlString: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let imageData = data else{return}
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}
