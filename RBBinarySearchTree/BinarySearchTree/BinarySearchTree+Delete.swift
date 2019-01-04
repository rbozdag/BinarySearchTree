//
//  BinarySearchTree+DeleteExtension.swift
//  RBBinarySearchTree
//
//  Created by Rahmi on 3.01.2019.
//  Copyright © 2019 rbozdag. All rights reserved.
//

import Foundation

public extension BinarySearchTree {
    public func delete(_ value: Element) {
        BinarySearchTree.delete(value, rootNode)
    }

    @discardableResult
    public class func delete(_ value: Element, _ rootNode: Node<Element>?) -> Node<Element>? {
        guard let root = rootNode else { return rootNode }

        // Traversal to left node
        if value < root.value {
            root.leftNode = BinarySearchTree.delete(value, root.leftNode)
            return root
        }

        // Traversal to right node
        if value > root.value {
            root.rightNode = BinarySearchTree.delete(value, root.rightNode)
            return root
        }

        // have one child on left node
        if let leftNode = root.leftNode, root.rightNode == nil {
            return leftNode
        }

        // have one child on right node
        if let rightNode = root.rightNode, root.leftNode == nil { // have one child
            return rightNode
        }

        // have two child
        if (root.leftNode != nil && root.rightNode != nil) {
            if root.leftNode!.height < root.rightNode!.height {
                let minRight = BinarySearchTree.findMin(root.rightNode)!
                rootNode?.value = minRight.value
                root.rightNode = BinarySearchTree.delete(minRight.value, root.rightNode)
            } else {
                let maxLeft = BinarySearchTree.findMax(root.leftNode)!
                rootNode?.value = maxLeft.value
                root.leftNode = BinarySearchTree.delete(maxLeft.value, root.leftNode)
            }
            return root
        }

        // have no child
        return nil
    }
}
