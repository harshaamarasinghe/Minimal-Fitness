//
//  TabBarController.swift
//  Minimal Fitness
//
//  Created by Harsha Amarasinghe on 2023-05-15.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.setHidesBackButton(true, animated: true)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.setupTab()
        
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .orange
    }
    

    private func setupTab(){
        
        let home = self.createNav(with: "Home", and: UIImage(systemName: "house"), vc: viewHome())
        let schedule = self.createNav(with: "Schedule", and: UIImage(systemName: "calendar"), vc: viewSchedule())
        let progress = self.createNav(with: "Progress", and: UIImage(systemName: "chart.xyaxis.line"), vc: viewProgress())
        let profile = self.createNav(with: "Profile", and: UIImage(systemName: "person.crop.circle"), vc: viewProfile())

        self.setViewControllers([home,schedule,progress,profile], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController{
        
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
        
        return nav
        
    }
}
