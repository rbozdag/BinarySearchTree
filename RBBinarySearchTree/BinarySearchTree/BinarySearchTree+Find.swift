//
//  BinarySearchTree+FindExtension.swift
//  RBBinarySearchTree
//
//  Created by Rahmi on 3.01.2019.
//  Copyright © 2019 rbozdag. All rights reserved.
//

import Foundation

public extension BinarySearchTree {
    public func find(_ element: Element) -> Node<Element>? {
        return BinarySearchTree.find(element, rootNode)
    }

    public func findMin() -> Node<Element>? {
        return BinarySearchTree.findMin(rootNode)
    }

    public static func findMin(_ rootNode: Node<Element>?) -> Node<Element>? {
        guard let rootNode = rootNode else { return nil }

        if let leftNode = rootNode.leftNode {
            return BinarySearchTree.findMin(leftNode)
        } else {
            return rootNode
        }
    }

    public func findMax() -> Node<Element>? {
        return BinarySearchTree.findMax(rootNode)
    }

    public static func findMax(_ rootNode: Node<Element>?) -> Node<Element>? {
        guard let rootNode = rootNode else { return nil }

        if let rightNode = rootNode.rightNode {
            return BinarySearchTree.findMax(rightNode)
        } else {
            return rootNode
        }
    }

    public static func find(_ element: Element, _ rootNode: Node<Element>?) -> Node<Element>? {
        guard let rootNode = rootNode else { return nil }

        if rootNode.value == element {
            return rootNode
        } else if element < rootNode.value {
            return BinarySearchTree.find(element, rootNode.leftNode)
        } else {
            return BinarySearchTree.find(element, rootNode.rightNode)
        }
    }
}
