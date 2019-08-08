//
//  MainPageViewController.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 6.08.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import UIKit

class MainPageViewController: UIViewController {
    @IBOutlet weak var categoriesTableView: UITableView!
    var viewModel: MainPageViewModelProtocol!{
        didSet{
            viewModel.delegate = self;
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
    }
}

extension MainPageViewController:MainPageViewModelDelegate{
    func notifyViewController(_ output: MainPageDelegationType) {
        switch output {
        case .setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        }
    }
    
    
}

extension MainPageViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let categoriesCell = tableView.dequeueReusableCell(withIdentifier: "categoriesCell", for: indexPath) as! CategoriesTableViewCell
        let cellViewModel = CategoriesCellViewModel()
        categoriesCell.viewModel = cellViewModel
        categoriesCell.backgroundColor = UIColor.red
        return categoriesCell
    }
    
}

extension MainPageViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
