//
//  RBBinarySearchTreeTraversalTests.swift
//  RBBinarySearchTreeTests
//
//  Created by Rahmi on 3.01.2019.
//  Copyright © 2019 rbozdag. All rights reserved.
//

import Foundation
import XCTest
@testable import RBBinarySearchTree

class BinarySearchTreeTraversalTests: XCTestCase {
    var tree: BinarySearchTree<Int>!

    override func setUp() {
        tree = BinarySearchTree<Int>()

        tree.insert(25)
        tree.insert(15)
        tree.insert(50)
        tree.insert(10)
        tree.insert(22)
        tree.insert(35)
        tree.insert(70)
        tree.insert(4)
        tree.insert(12)
        tree.insert(18)
        tree.insert(24)
        tree.insert(31)
        tree.insert(44)
        tree.insert(71)
    }

    func testInorderTraversal() {
        let inorderdValues = tree.inorder().map { return $0.value }
        XCTAssertEqual(inorderdValues.sorted(), inorderdValues)
        XCTAssertEqual(inorderdValues, [4, 10, 12, 15, 18, 22, 24, 25, 31, 35, 44, 50, 70, 71])
    }

    func testPostorderTraversal() {
        let postorderValues = tree.postorder().map { return $0.value }
        XCTAssertEqual(postorderValues, [4, 12, 10, 18, 24, 22, 15, 31, 44, 35, 71, 70, 50, 25])
    }

    func testPreorderTraversal() {
        let preorderValues = tree.preorder().map { return $0.value }
        XCTAssertEqual(preorderValues, [25, 15, 10, 4, 12, 22, 18, 24, 50, 35, 31, 44, 70, 71])
    }
    
    func testLevelorderTraversal() {
        let levelorderValues = tree.levelOrder().map { return $0.value }
        XCTAssertEqual(levelorderValues,[25, 15, 50, 10, 22, 35, 70, 4, 12, 18, 24, 31, 44, 71])
    }
}
