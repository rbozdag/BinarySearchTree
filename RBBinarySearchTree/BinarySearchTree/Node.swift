//
//  Node.swift
//  RBBinarySearchTree
//
//  Created by Rahmi on 3.01.2019.
//  Copyright © 2019 rbozdag. All rights reserved.
//

import Foundation

public class Node<Element> where Element: Comparable&Equatable {
    public var leftNode: Node<Element>?
    public var rightNode: Node<Element>?
    public var value: Element

    //✅ a node is full if has 0 or 2 children
    public var isPerfect: Bool { return childredCount == 2 }

    //✅ a node is leaf if has 0 children
    public var isLeaf: Bool { return childredCount == 0 }

    //✅ The height of a node is the number of edges from the node to the deepest leaf.
    public var height: Int { return Node.height(self) }

    public var childredCount: Int { return (leftNode != nil ? 1 : 0) + (rightNode != nil ? 1 : 0) }

    public init(_ value: Element) {
        self.value = value
    }

    public func insert(_ newValue: Element) {
        if value >= newValue {
            if let leftNode = leftNode {
                leftNode.insert(newValue)
            } else {
                leftNode = Node(newValue)
            }
        } else {
            if let rightNode = rightNode {
                rightNode.insert(newValue)
            } else {
                rightNode = Node(newValue)
            }
        }
    }

    //The level of a node is defined by 1 + the number of connections between the node and the root.
    public func level(from node: Node<Element>?, currentLevel: Int = 0) -> Int {
        return depth(from: node, currentDepth: currentLevel) + 1
    }

    //✅ The depth of a node is the number of edges from the given parent node to the node.
    public func depth(from node: Node<Element>?, currentDepth: Int = 0) -> Int {
        guard let node = node else { return 0 }

        if node.value == self.value {
            return currentDepth
        }

        let leftDepth = depth(from: node.leftNode, currentDepth: currentDepth + 1)
        if leftDepth != 0 {
            return leftDepth
        }

        let rightDepth = depth(from: node.rightNode, currentDepth: currentDepth + 1)
        return rightDepth
    }

    //✅ The height of a node is the number of edges from the node to the deepest leaf.
    private static func height(_ node: Node<Element>?) -> Int {
        guard let node = node else {
            return -1
        }

        let leftHeight = height(node.leftNode)
        let rightHeight = height(node.rightNode)

        return max(leftHeight, rightHeight) + 1
    }
}
