//
//  BinarySearchTree+Print.swift
//  RBBinarySearchTree
//
//  Created by Rahmi on 4.01.2019.
//  Copyright © 2019 rbozdag. All rights reserved.
//

import Foundation

public extension BinarySearchTree {
    class func horizantalOrder(_ root: Node<Element>?, _ space: Int, _ text: String) -> String
    {
        guard let root = root else { return text }

        let count = 15
        let space = space + count

        var text = horizantalOrder(root.rightNode, space, text)

        text.append("\n")
        for _ in count..<space {
            text.append(" ")
        }
        text.append(String(describing: root.value))
        text.append("\n")

        text = horizantalOrder(root.leftNode, space, text)

        return text
    }

    func horizantalOrder(space: Int) -> String {
        return BinarySearchTree.horizantalOrder(rootNode, space, "")
    }

    func printHorizantalOrder(space: Int)
    {
        print(horizantalOrder(space: space))
    }
}
