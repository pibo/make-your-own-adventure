//
//  Node.swift
//  Make Your Own Adventure
//
//  Created by Felipe Ribeiro on 27/11/18.
//  Copyright © 2018 Felipe Ribeiro. All rights reserved.
//

import Foundation

class Node {
    
    // MARK: Properties
    
    let title: String
    let message: String
    var prompts: [Prompt]
    
    // MARK: Initializer
    
    init(dictionary: NodeDictionary) {
        title = dictionary["title"] as! String
        message = (dictionary["message"] as! String).replacingOccurrences(of: "\\n", with: "\n\n")
        prompts = [Prompt]()
    }
    
    // MARK: Methods
    
    func initPrompts(_ prompts: PromptList?, siblings: [Node]) {
        guard let prompts = prompts else { return }
        
        for prompt: PromptDictionary in prompts {
            self.prompts.append(Prompt(dictionary: prompt, nodes: siblings))
        }
    }
}
