//
//  MainPageBuilder.swift
//  MovieDatabase
//
//  Created by Hakan Silek on 6.08.2019.
//  Copyright © 2019 Hakan Silek. All rights reserved.
//

import UIKit

final class MainPageBuilder{
    static func make() -> MainPageViewController{
        let storyboard = UIStoryboard(name: "MainPage", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MainPageViewController")  as! MainPageViewController
        let viewModel = MainPageViewModel()
        viewController.viewModel = viewModel
        return viewController
    }
}
