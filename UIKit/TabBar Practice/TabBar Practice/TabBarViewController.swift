//
//  TabBarViewController.swift
//  TabBar Practice
//
//  Created by Kim Yewon on 2023/10/16.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        
        self.tabBar.barTintColor = .systemGreen
        self.tabBar.tintColor = .green
        self.tabBar.unselectedItemTintColor = .gray
    }
    
    private func setupTabs() {
        let home = self.createNav(with: "Home", and: UIImage(systemName: "house"), vc: HomeController())
        let history = self.createNav(with: "History", and: UIImage(systemName: "clock"), vc: HistoryViewController())
        let workout = self.createNav(with: "Workout", and: UIImage(systemName: "person"), vc: WorkoutController())
        let exercise = self.createNav(with: "Exercise", and: UIImage(systemName: "cloud.snow"), vc: ViewController())
        
        self.setViewControllers([home, history, workout, exercise], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        nav.viewControllers.first?.navigationItem.title = title + "Controller"
        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "button", style: .plain, target: nil, action: nil)
        
        return nav
    }
}
