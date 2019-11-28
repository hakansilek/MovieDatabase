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
    private var categoryCellPresentation:MainPageCategoryCellPresentation?
    private var viewModel: CategoryCellViewModelProtocol!{
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
        case .error:
            handleErrorCase()
        }
    }
    
    func navigate(to detailPage: CategoryCellRouter) {
        switch detailPage {
        case .detail(let item):
            NSLog("DidSelect %d", item)
        }
    }
    
    private func handleErrorCase() {
        self.categoryCellTitle.text = ""
        addErrorMessageView()
    }
}
extension CategoryTableViewCell:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let presentation = categoryCellPresentation else {
            return 0
        }
        return presentation.categoryCellList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCollectionViewCell
        
        guard let presentation = categoryCellPresentation else {
            return UICollectionViewCell()
        }
        let movie = presentation.categoryCellList[indexPath.row]
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
