//
//  Storage.swift
//  Logos
//
//  Created by Mufeed AlMatar on 17/05/2019.
//  Copyright © 2019 GreenX. All rights reserved.
//

import Foundation

protocol Storage {
    func getNodeByID(id: String) -> Node?
    func getTopNodes() -> [Node]
    func getChildren(node: Node) -> [Node]
}

class DB {
    static let instance: Storage = StaticDB()
}
