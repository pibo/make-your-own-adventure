//
//  NodeViewController.swift
//  Make Your Own Adventure
//
//  Created by Felipe Ribeiro on 28/11/18.
//  Copyright © 2018 Felipe Ribeiro. All rights reserved.
//

import UIKit
import SafariServices

class NodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    
    var adventure: Adventure!
    var node: Node!
    
    // MARK: Outlets
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var textView: UITextView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var creditsContainer: UIStackView!
    @IBOutlet var creditsTitle: UILabel!
    @IBOutlet var creditsAuthor: UILabel!
    @IBOutlet var startOverButton: UIButton!
    
    // MARK: Life Cycle Methods
    
    override func viewDidLoad() {
        imageView.image = adventure.credits.image
        textView.text = node.message
        
        // Control dynamic items visibility.
        let atRoot = node === adventure.nodes.first
        startOverButton.isHidden = !node.prompts.isEmpty
        
        if atRoot {
            creditsContainer.isHidden = false
            creditsTitle.text = adventure.credits.title
            creditsAuthor.text = adventure.credits.author
        }
    }
    
    
    // MARK: Actions
    
    @IBAction func startOver() {
        let root = navigationController!.viewControllers[1]
        navigationController?.popToViewController(root, animated: true)
    }
    
    @IBAction func readOriginal() {
        let controller = SFSafariViewController(url: adventure.credits.source)
        controller.modalPresentationStyle = .overFullScreen
        present(controller, animated: true)
    }
    
    // MARK: UITableView Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return node.prompts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PromptCell")!
        cell.textLabel?.text = node.prompts[indexPath.row].message
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextNode = node.prompts[indexPath.row].destination
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "NodeViewController") as! NodeViewController
        controller.adventure = adventure
        controller.node = nextNode
        
        navigationController?.pushViewController(controller, animated: true)
    }
}
