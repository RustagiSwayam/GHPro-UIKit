//
//  FollowerListViewController.swift
//  GHPro
//
//  Created by Swayam Rustagi on 17/07/24.
//

import UIKit

class FollowerListViewController: UIViewController {

    
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor  = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        print(username)
    }

}
