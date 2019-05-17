//
//  StaticDB.swift
//  Logos
//
//  Created by Mufeed AlMatar on 17/05/2019.
//  Copyright © 2019 GreenX. All rights reserved.
//

import Foundation

class StaticDB : Storage {
    func getNodeByID(id: String) -> Node? {
        let nodes = allNodes.filter {
            $0.objectId == id
        }
        return nodes.isEmpty ? nil : nodes[0]
    }
    
    func getTopNodes() -> [Node] {
        return allNodes.filter { topNodes.contains($0.objectId) }
    }
    
    func getChildren(node: Node) -> [Node] {
        var nodes: [Node] = []
        for childId in node.children {
            if let node = getNodeByID(id: childId) {
                nodes.append(node)
            }
        }
        return nodes
    }

    let allNodes: [Node] = [
        Node(objectId:"0", title: "Nutrition Made Clear", content: "", children: [ "1", "2" ]),
        Node(objectId:"1", title: "Author", content: "", children: [ "3" ]),
        Node(objectId:"2", title: "Table of Contents", content: "", children: [ "4", "5", "6", "7" ]),
        Node(objectId:"3", title: "Roberta H. Anding", content: "", children: [  ]),
        Node(objectId:"4", title: "Why We Eat What We Do", content: "", children: [  ]),
        Node(objectId:"5", title: "Sources of Nutritin Fact and Fiction", content: "", children: [  ]),
        Node(objectId:"6", title: "Our Underapprecited Digistivvev Tract", content: "", children: [ "8", "18" ]),
        Node(objectId:"7", title: "It's All about Calories!", content: "", children: [  ]),
        Node(objectId:"8", title: "Diarrhea", content: "", children: [ "9" ]),
        Node(objectId:"9", title: "Caused By", content: "", children: [ "10", "13", "14", "15" ]),
        Node(objectId:"10", title: "GI Irritants", content: "", children: [ "11" ]),
        Node(objectId:"11", title: "such as", content: "", children: [ "12" ]),
        Node(objectId:"12", title: "Food poisoning", content: "", children: [  ]),
        Node(objectId:"13", title: "dumping syndrome", content: "", children: [  ]),
        Node(objectId:"14", title: "Inflammatory bowel diseasse", content: "", children: [  ]),
        Node(objectId:"15", title: "Antibiotic", content: "", children: [ "16" ]),
        Node(objectId:"16", title: "Why?", content: "", children: [ "17" ]),
        Node(objectId:"17", title: "It flattenss the villi and kills all the bacteria in the large intestine", content: "", children: [  ]),
        Node(objectId:"18", title: "Constimpation", content: "", children: [ "19", "27" ]),
        Node(objectId:"19", title: "Caused By", content: "", children: [ "20", "21",  "24",  "25",  "26" ]),
        Node(objectId:"20", title: "Stress", content: "", children: [  ]),
        Node(objectId:"21", title: "long-term use of iron", content: "", children: [ "22" ]),
        Node(objectId:"22", title: "why?", content: "", children: [ "23" ]),
        Node(objectId:"23", title: "Iron can alter the way your nervous system performss and can shut the last sphincter", content: "", children: [  ]),
        Node(objectId:"24", title: "low-fiber", content: "", children: [  ]),
        Node(objectId:"25", title: "low flouid intake", content: "", children: [  ]),
        Node(objectId:"26", title: "late of exercise", content: "", children: [  ]),
        Node(objectId:"27", title: "Treatment", content: "", children: [ "28", "29" ]),
        Node(objectId:"28", title: "Exercise", content: "", children: [  ]),
        Node(objectId:"29", title: "Adequate intake of iber", content: "", children: [  ])
    ]
    
    let topNodes: [String] = [ "0" ]
}
