//
//  Credits.swift
//  Make Your Own Adventure
//
//  Created by Felipe Ribeiro on 27/11/18.
//  Copyright © 2018 Felipe Ribeiro. All rights reserved.
//

import Foundation
import UIKit

struct Credits {
    
    // MARK: Properties
    
    let id: String
    let title: String
    let author: String
    let source: URL!
    let image: UIImage!
    
    // MARK: Initializer
    
    init(dictionary: CreditsDictionary) {
        id = dictionary["id"]!
        title = dictionary["title"]!
        author = dictionary["author"]!
        source = URL(string: dictionary["source"]!)
        image = UIImage(named: dictionary["image"]!)
    }
}
