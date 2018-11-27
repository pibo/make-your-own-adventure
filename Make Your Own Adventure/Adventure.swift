//
//  Adventure.swift
//  Make Your Own Adventure
//
//  Created by Felipe Ribeiro on 27/11/18.
//  Copyright © 2018 Felipe Ribeiro. All rights reserved.
//

import Foundation

class Adventure {

    // MARK: Properties
    
    let credits: Credits
    var nodes: [Node]
    
    
    // MARK: Initializer
    
    init(dictionary: AdventureDictionary) {
        credits = Credits(dictionary: dictionary["credits"] as! CreditsDictionary)
        
        let nodeList = dictionary["nodes"] as! NodeList
        
        nodes = [Node]()
        for node: NodeDictionary in nodeList {
            nodes.append(Node(dictionary: node))
        }
        
        for (i, node) in nodeList.enumerated() {
            nodes[i].initPrompts(node["prompts"] as? PromptList, siblings: nodes)
        }
    }
}
