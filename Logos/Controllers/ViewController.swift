//
//  ViewController.swift
//  Logos
//
//  Created by Mufeed AlMatar on 16/05/2019.
//  Copyright © 2019 GreenX. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private static let TopicCellIdentifier = "TopicCellIdentifier"
    
    var nodes: [Node] = []
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.isEnabled = false
        
        tableView.dataSource = self
        tableView.delegate = self
        
        nodes = DB.instance.getTopNodes();
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewController.TopicCellIdentifier)!

        let node = nodes[indexPath.row]
        cell.textLabel?.text = node.title
        cell.detailTextLabel?.text = node.content
        return cell
    }
    
    func pushNewNode(node: Node, isBackward: Bool = false) {
        let children = DB.instance.getChildren(node: node)
        if !children.isEmpty {
            nodes.removeAll()
            for n in children {
                nodes.append(n)
            }
            tableView.reloadData()
            navigationBar.topItem?.title = node.title
            backButton.isEnabled = true
            if !isBackward {
                AppState.shared.setCurrentNode(node: node)
            }
        }
        
    }
    
    @IBAction func pushParentNode(_ sender: Any) {
        AppState.shared.removeCurrentNode()
        if let node = AppState.shared.getCurrentNode() {
            pushNewNode(node: node, isBackward: true)
        } else {
            backButton.isEnabled = false
            navigationBar.topItem?.title = "Logos"
            nodes = DB.instance.getTopNodes();
            tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let node = nodes[indexPath.row]
        pushNewNode(node: node)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return !nodes[indexPath.row].children.isEmpty
    }

}

