//
//  TableViewCell.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 6.08.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    var movie:[MainPageMoviePresentation]?
    var viewModel: CategoriesCellViewModelProtocol!{
        didSet{
            viewModel.delegate = self
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
    }
}
extension CategoriesTableViewCell: CategoriesCellViewModelDelegate{
    func navigate(to detailPage: CategoriesCellRouter) {
        switch detailPage {
        case .detail(let item):
            NSLog("DidSelect %d", item)
        }
    }
}
extension CategoriesTableViewCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let movieArr = movie else{return 0}
        
        return movieArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCollectionViewCell
        
        
        
        guard let movieArr = movie else{return UICollectionViewCell()}
        let movie = movieArr[indexPath.row]
        categoryCell.setMainPageMoviePresentation(movie: movie)
        
        return categoryCell
    }
    
}

extension CategoriesTableViewCell: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelect(indexPath)
    }
}

extension CategoriesTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.height*0.6, height: collectionView.bounds.height)
    }
}
extension CategoriesTableViewCell: ConfigurableCell{
    func configure(data row: MainPageListPresentation, viewModel: CategoriesCellViewModelProtocol) {
        self.categoryTitle.text = row.rowTitle
        self.movie = row.movies
        self.viewModel = viewModel
    }
}
