//
//  Prompt.swift
//  Make Your Own Adventure
//
//  Created by Felipe Ribeiro on 27/11/18.
//  Copyright © 2018 Felipe Ribeiro. All rights reserved.
//

import Foundation

struct Prompt {
    
    // MARK: Properties
    
    let message: String
    let destination: Node
    
    // MARK: Initializer
    
    init(dictionary: PromptDictionary, nodes: [Node]) {
        message = dictionary["message"] as! String
        destination = nodes[dictionary["destination"] as! Int]
    }
}
