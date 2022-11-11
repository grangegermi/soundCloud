//
//  ViewController.swift
//  SoundCloud
//
//  Created by Даша Волошина on 3.10.22.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let  homeVC  = UINavigationController(rootViewController: HomeViewController())
        let  searchVC = UINavigationController(rootViewController: SearchViewController())
        let  libraryVC = UINavigationController(rootViewController: LibraryViewController())
        
        homeVC.title = "Home"
        searchVC.title = "Search"
        libraryVC.title = "Library"
        
        
        homeVC.tabBarItem.image = UIImage(systemName: "house")
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        libraryVC.tabBarItem.image = UIImage(systemName: "building.columns")
        
        self.tabBar.tintColor = .gray
        self.tabBar.backgroundColor = .white
        self.setViewControllers([homeVC, searchVC, libraryVC], animated: false)
    }


}

