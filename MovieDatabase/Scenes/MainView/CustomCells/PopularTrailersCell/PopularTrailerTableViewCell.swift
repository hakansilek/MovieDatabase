//
//  PopularTrailerTableViewCell.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 16.11.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import UIKit

class PopularTrailerTableViewCell: UITableViewCell {

    @IBOutlet weak var popularTrailerCellTitle: MainPageRowTitle!
    @IBOutlet weak var popularTrailerCollectionView: UICollectionView!
    @IBOutlet weak var popularTrailerPageControl: UIPageControl!
    private var popularTrailerCellPresentation: MainPagePopularTrailerCellPresentation?
    private var viewModel: PopularTrailerCellProtocol!{
        didSet{
            viewModel.delegate = self
            viewModel.load()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = .black
        popularTrailerCollectionView.backgroundColor = .black
        popularTrailerPageControl.currentPage = 0
        popularTrailerPageControl.numberOfPages = 0
    }
}

extension PopularTrailerTableViewCell: PopularTrailerCellViewModelDelegate{
    func notifyPopularTrailerCell(_ output: PopularTrailerCellOutput) {
        switch output {
        case .setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        case .setPopularTrailerCellData(let popularTrailerCellData):
            popularTrailerCellPresentation = popularTrailerCellData
            popularTrailerCellTitle.text = popularTrailerCellData.popularTrailerCellTitle
             popularTrailerPageControl.numberOfPages = popularTrailerCellData.popularTrailerCellList.count
        case .error:
            handleErrorCase()
        }
    }
    
    private func handleErrorCase() {
        self.popularTrailerCellTitle.text = ""
        addErrorMessageView()
    }
}

extension PopularTrailerTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let presentation = popularTrailerCellPresentation else {
            return 0
        }
        
        return presentation.popularTrailerCellList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let popularTrailerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "popularTrailerCell", for: indexPath) as! PopularTrailerCollectionViewCell
        guard let presentation = popularTrailerCellPresentation else {
            return UICollectionViewCell()
        }
        popularTrailerCell.setPopularTrailerPresentation(popularTrailer: presentation.popularTrailerCellList[indexPath.row])
        return popularTrailerCell
    }
}

extension PopularTrailerTableViewCell: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width , height: collectionView.frame.size.height)
    }
}
extension PopularTrailerTableViewCell: UICollectionViewDelegate{
    
}

extension PopularTrailerTableViewCell: ConfigurableCell{
    func configure(viewModel: MainPageCellViewModelProtocol) {
        if(self.viewModel == nil){
            self.viewModel = viewModel as? PopularTrailerCellProtocol
        }
    }
}
extension PopularTrailerTableViewCell: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        popularTrailerPageControl.currentPage = Int(round(scrollView.contentOffset.x / self.frame.size.width))
    }
}
