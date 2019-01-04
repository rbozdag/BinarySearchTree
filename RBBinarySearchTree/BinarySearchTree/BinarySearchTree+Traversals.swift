//
//  BinarySearchTree+Traversals.swift
//  RBBinarySearchTree
//
//  Created by Rahmi on 3.01.2019.
//  Copyright © 2019 rbozdag. All rights reserved.
//

import Foundation

public extension BinarySearchTree {
    public func inorder() -> Array<Node<Element>> {
        var ordered = Array<Node<Element>>()
        BinarySearchTree.inorder(rootNode, &ordered)
        return ordered
    }

    //✅ Inorder gives nodes in increasing order
    public static func inorder(_ node: Node<Element>?, _ ordered: inout Array<Node<Element>>) {
        guard let node = node else { return }

        inorder(node.leftNode, &ordered)

        ordered.append(node)

        inorder(node.rightNode, &ordered)
    }

    public func preorder() -> Array<Node<Element>> {
        var ordered = Array<Node<Element>>()
        BinarySearchTree.preorder(rootNode, &ordered)
        return ordered
    }

    private static func preorder(_ node: Node<Element>?, _ ordered: inout Array<Node<Element>>) {
        guard let node = node else { return }

        ordered.append(node)

        preorder(node.leftNode, &ordered)

        preorder(node.rightNode, &ordered)
    }

    public func postorder() -> Array<Node<Element>> {
        var ordered = Array<Node<Element>>()
        BinarySearchTree.postorder(rootNode, &ordered)
        return ordered
    }

    public static func postorder(_ node: Node<Element>?, _ ordered: inout Array<Node<Element>>) {
        guard let node = node else { return }

        postorder(node.leftNode, &ordered)

        postorder(node.rightNode, &ordered)

        ordered.append(node)
    }

    /* Print nodes at the given level */
    public func levelOrder() -> Array<Node<Element>> {
        var ordered = Array<Node<Element>?>()

        for i in 1...height {
            levelOrder(rootNode, i, &ordered);
        }

        return ordered.compactMap { return $0 }
    }

    /* Print nodes at the given level */
    private func levelOrder(_ root: Node<Element>?, _ level: Int, _ ordered: inout Array<Node<Element>?>)
    {
        guard let root = root else { return }
        guard level > 0 else { return }

        if level == 1 {
            ordered.append(root)
        } else if level > 1 {
            levelOrder(root.leftNode, level - 1, &ordered)
            levelOrder(root.rightNode, level - 1, &ordered)
        }
    }
}
