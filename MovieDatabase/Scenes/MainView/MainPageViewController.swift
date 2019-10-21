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
    var cellConfigurator: [CellConfigurator]=[]
    var viewModel: MainPageViewModelProtocol!{
        didSet{
            viewModel.delegate = self;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        viewModel.load()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension MainPageViewController:MainPageViewModelDelegate{
    func notifyViewController(_ output: MainPageDelegationType) {
        switch output {
        case .setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        case .setList(let cellConfiguratorItems):
            self.cellConfigurator = cellConfiguratorItems
            self.categoriesTableView.reloadData()
        }
        
    }
    
}

extension MainPageViewController: UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellConfigurator.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = cellConfigurator[indexPath.row]
        
        let categoriesCell = tableView.dequeueReusableCell(withIdentifier: type(of: item).reuseId, for: indexPath)
        categoriesCell.selectionStyle = UITableViewCell.SelectionStyle.none
         item.configure(cell: categoriesCell)
        
        return categoriesCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension MainPageViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = cellConfigurator[indexPath.row]
        return CGFloat(item.cellHeigth)
    }
}
