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
        
        navigationItem.title = "Make Your Own Adventure"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Start Over", style: .plain, target: self, action: #selector(startOver))
    }
    
    @objc func startOver() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    deinit {
        print("View Controller deallocated")
    }
}

