//
//  MYOAViewController.swift
//  Make Your Own Adventure
//
//  Created by Felipe Ribeiro on 03/11/18.
//  Copyright © 2018 Felipe Ribeiro. All rights reserved.
//

import UIKit

class MYOAViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userIsAtRootViewController = navigationController?.viewControllers.count == 1
        if !userIsAtRootViewController {
            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start Over", style: .plain, target: self, action: #selector(startOver))
        }
    }
    
    @objc func startOver() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    deinit {
        print("View Controller deallocated")
    }
}

