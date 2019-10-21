//
//  SuggestionTableViewCell.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 17.08.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import UIKit

class SuggestionTableViewCell: UITableViewCell {

    @IBOutlet weak var suggestionOfDayIV: UIImageView!
    
    @IBOutlet weak var lbl: UILabel!
//    let movie1 = Movie(movieName: "The Shawshank Redemption", moviePoster: "https://images-na.ssl-images-amazon.com/images/I/51PmHDi0bFL.jpg", movieYear: "1994", movieFragman: "")
//    var data:Data!
//    var poster:URL!
    
    override func prepareForReuse() {
//        poster  = URL(string: movie1.moviePoster)
//        data = try? Data(contentsOf: poster!)
    }
}

extension SuggestionTableViewCell: ConfigurableCell{
    func configure(data movie: MovieOfDay, viewModel: CategoriesCellViewModelProtocol) {
        self.lbl.text = movie.text
    }
}
