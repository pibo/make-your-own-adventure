//
//  NewAdventureViewController.swift
//  Make Your Own Adventure
//
//  Created by Felipe Ribeiro on 03/11/18.
//  Copyright © 2018 Felipe Ribeiro. All rights reserved.
//

import UIKit

class NewAdventureViewController: UITableViewController {
    
    // MARK: Properties
    
    var adventures = [Adventure]()
    
    // MARK: Life Cycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let plists = Bundle.main.paths(forResourcesOfType: "plist", inDirectory: nil)
        
        for plist in plists {
            guard (plist as NSString).lastPathComponent != "Info.plist" else { continue }
            if let adventure = NSDictionary(contentsOfFile: plist) as? AdventureDictionary {
                adventures.append(Adventure(dictionary: adventure))
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    // MARK: UITableView Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return adventures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdventureCell")!
        let adventure = adventures[indexPath.row]
        
        cell.textLabel?.text = adventure.credits.title
        cell.detailTextLabel?.text = adventure.credits.author
        cell.imageView?.image = adventure.credits.image
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let adventure = adventures[indexPath.row]
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "NodeViewController") as! NodeViewController
        controller.adventure = adventure
        controller.node = adventure.nodes.first
        
        navigationController?.pushViewController(controller, animated: true)
    }
}
