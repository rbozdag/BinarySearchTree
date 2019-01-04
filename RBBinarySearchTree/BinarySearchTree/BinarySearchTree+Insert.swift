//
//  BinarySearchTree+Insert.swift
//  RBBinarySearchTree
//
//  Created by Rahmi on 3.01.2019.
//  Copyright © 2019 rbozdag. All rights reserved.
//

import Foundation

public extension BinarySearchTree {
    public func insert(_ value: Element) {
        if let rootNode = rootNode {
            rootNode.insert(value)
        } else {
            rootNode = Node(value)
        }
    }
}
