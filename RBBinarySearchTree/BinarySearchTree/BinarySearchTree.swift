//
//  BinarySearchTree.swift
//  RBBinarySearchTree
//
//  Created by Rahmi on 3.01.2019.
//  Copyright © 2019 rbozdag. All rights reserved.
//

import Foundation

public class BinarySearchTree<Element> where Element: Comparable&Equatable {
    var rootNode: Node<Element>?

    //✅ A Binary Tree is full if every node has 0 or 2 children
    public var isFull: Bool { return BinarySearchTree.isFull(from: self.rootNode) }

    //✅ A Binary Tree is full if every node has 0 or 2 children
    public var isPerfect: Bool { return BinarySearchTree.isPerfect(rootNode: rootNode, currentNode: rootNode) }

    //✅ get total node count
    public var nodeCount: Int { return BinarySearchTree.nodeCount(from: self.rootNode) }

    //✅ in tree, height is number of nodes along the longest path from the root node down to the farthest leaf node.
    public var height: Int {
        guard let rootNode = rootNode else { return 0 }
        return rootNode.height + 1
    }

    //✅ in tree, maxDepth and height is equal
    public var maxDepth: Int { return height }

    //✅ in tree, minimum depth is the number of nodes along the shortest path from root node down to the nearest leaf node.
    public var minDepth: Int { return BinarySearchTree.minDepth(self.rootNode) }

    //✅ in tree, minimum depth is the number of nodes along the shortest path from root node down to the nearest leaf node.
    private class func minDepth(_ node: Node<Element>?) -> Int {
        guard let node = node else {
            return 0
        }

        if node.leftNode == nil && node.rightNode == nil {
            return 1
        }

        if node.leftNode == nil {
            return minDepth(node.rightNode) + 1
        }

        if node.rightNode == nil {
            return minDepth(node.leftNode) + 1
        }

        return min(minDepth(node.leftNode), minDepth(node.rightNode)) + 1
    }

    //✅ A Node is full if every sub node has 0 or 2 children
    private class func isFull(from node: Node<Element>?) -> Bool {
        if node == nil {
            return true
        }

        if node!.isLeaf {
            return true
        }

        if node!.isPerfect {
            return isFull(from: node!.leftNode) && isFull(from: node!.rightNode)
        }

        return false
    }

    //✅ get total node count
    private class func nodeCount(from node: Node<Element>?) -> Int {
        if node == nil {
            return 0
        }

        return 1 + nodeCount(from: node!.leftNode) + nodeCount(from: node!.rightNode)
    }

    private class func isPerfect(rootNode: Node<Element>?, currentNode: Node<Element>?) -> Bool {
        if currentNode == nil {
            return true
        }

        if rootNode == nil {
            return true
        }

        let currentNodeDepth = currentNode!.depth(from: rootNode)
        let ld = currentNode!.leftNode?.depth(from: rootNode) ?? currentNodeDepth
        let rd = currentNode!.rightNode?.depth(from: rootNode) ?? currentNodeDepth

        return(ld == rd && BinarySearchTree.isPerfect(rootNode: rootNode, currentNode: currentNode?.leftNode) && BinarySearchTree.isPerfect(rootNode: rootNode, currentNode: currentNode?.rightNode));
    }
}
