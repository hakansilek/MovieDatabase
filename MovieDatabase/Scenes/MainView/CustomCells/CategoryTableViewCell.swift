//
//  TableViewCell.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 6.08.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryCellTitle: UILabel!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    fileprivate var categoryCellPresentation:MainPageCategoryCellPresentation!
    fileprivate var viewModel: CategoryCellViewModelProtocol!{
        didSet{
            viewModel.delegate = self
            viewModel.load()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .black
        categoryCollectionView.backgroundColor = .black
    }
}
extension CategoryTableViewCell: CategoryCellViewModelDelegate{
    func notifyCategoryCell(_ output: CategoryCellOutput) {
        switch output {
        case .setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        case .setCategoryCellData(let categoryCellData):
            self.categoryCellPresentation = categoryCellData
            self.categoryCellTitle.text = categoryCellData.categoryCellTitle
        }
    }
    
    func navigate(to detailPage: CategoryCellRouter) {
        switch detailPage {
        case .detail(let item):
            NSLog("DidSelect %d", item)
        }
    }
}
extension CategoryTableViewCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryCellPresentation.categoryCellList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCollectionViewCell
        
        let movie = categoryCellPresentation.categoryCellList[indexPath.row]
        categoryCell.setMainPageMoviePresentation(movie: movie)
        
        return categoryCell
    }
    
}

extension CategoryTableViewCell: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelect(indexPath)
    }
}

extension CategoryTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.height*0.6, height: collectionView.bounds.height)
    }
}
extension CategoryTableViewCell: ConfigurableCell{
    func configure(viewModel: MainPageCellViewModelProtocol) {
        if(self.viewModel==nil){
            self.viewModel = viewModel as? CategoryCellViewModelProtocol
        }
    }
}
