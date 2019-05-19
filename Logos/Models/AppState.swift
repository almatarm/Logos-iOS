//
//  AppState.swift
//  Logos
//
//  Created by Mufeed AlMatar on 17/05/2019.
//  Copyright © 2019 GreenX. All rights reserved.
//

import Foundation

class AppState {
    static let shared = AppState()
    
    var nodes: [Node] = []

    func setCurrentNode(node: Node) {
        nodes.append(node)
    }
    
    func getCurrentNode() -> Node? {
        return nodes.last
    }
    
    @discardableResult
    func removeCurrentNode() -> Node? {
        return nodes.removeLast()
    }
    
    private func printStack(_ title : String) {
        var stackIds: [String] = []
        for node in nodes {
            stackIds.append(node.objectId)
        }
        print("**********  ", title, "  ***********")
        print(stackIds)
    }
}
