//
//  TableViewCell.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 6.08.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import UIKit

class CategoriesTableViewCell: UITableViewCell {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    var viewModel: CategoriesCellViewModelProtocol!{
        didSet{
            viewModel.delegate = self
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
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
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCollectionViewCell
        
        categoryCell.backgroundColor = UIColor.green
        
        return categoryCell
    }
}

extension CategoriesTableViewCell: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       viewModel.didSelect(indexPath)
    }
}
