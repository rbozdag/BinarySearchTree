//
//  BinarySearchTreeDeleteTests.swift
//  RBBinarySearchTreeTests
//
//  Created by Rahmi on 3.01.2019.
//  Copyright © 2019 rbozdag. All rights reserved.
//

import Foundation
import XCTest
@testable import RBBinarySearchTree

class BinarySearchTreeDeleteTests: XCTestCase {

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

        tree.insert(80)
        tree.insert(85)
        tree.insert(72)
    }

    func testTryDeleteNonExistNode() {
        tree.delete(3453453)

        let inorderdValues = tree.inorder().map { return $0.value }
        XCTAssertEqual(inorderdValues.sorted(), inorderdValues)
        XCTAssertEqual(inorderdValues, [4, 10, 12, 15, 18, 22, 24, 25, 31, 35, 44, 50, 70, 71, 72, 80, 85])

        let postorderValues = tree.postorder().map { return $0.value }
        XCTAssertEqual(postorderValues, [4, 12, 10, 18, 24, 22, 15, 31, 44, 35, 72, 85, 80, 71, 70, 50, 25])

        let preorderValues = tree.preorder().map { return $0.value }
        XCTAssertEqual(preorderValues, [25, 15, 10, 4, 12, 22, 18, 24, 50, 35, 31, 44, 70, 71, 80, 72, 85])

        let levelorderValues = tree.levelOrder().map { return $0.value }
        XCTAssertEqual(levelorderValues, [25, 15, 50, 10, 22, 35, 70, 4, 12, 18, 24, 31, 44, 71, 80, 72, 85])
    }

    func testDeleteLeaf() {
        tree.delete(4)

        let inorderdValues = tree.inorder().map { return $0.value }
        XCTAssertEqual(inorderdValues.sorted(), inorderdValues)
        XCTAssertEqual(inorderdValues, [10, 12, 15, 18, 22, 24, 25, 31, 35, 44, 50, 70, 71, 72, 80, 85])

        let postorderValues = tree.postorder().map { return $0.value }
        XCTAssertEqual(postorderValues, [12, 10, 18, 24, 22, 15, 31, 44, 35, 72, 85, 80, 71, 70, 50, 25])

        let preorderValues = tree.preorder().map { return $0.value }
        XCTAssertEqual(preorderValues, [25, 15, 10, 12, 22, 18, 24, 50, 35, 31, 44, 70, 71, 80, 72, 85])

        let levelorderValues = tree.levelOrder().map { return $0.value }
        XCTAssertEqual(levelorderValues, [25, 15, 50, 10, 22, 35, 70, 12, 18, 24, 31, 44, 71, 80, 72, 85])
    }

    func testDeleteInnerNode() {
        tree.delete(50)

        let inorderdValues = tree.inorder().map { return $0.value }
        XCTAssertEqual(inorderdValues.sorted(), inorderdValues)
        XCTAssertEqual(inorderdValues, [4, 10, 12, 15, 18, 22, 24, 25, 31, 35, 44, 70, 71, 72, 80, 85])

        let postorderValues = tree.postorder().map { return $0.value }
        XCTAssertEqual(postorderValues, [4, 12, 10, 18, 24, 22, 15, 31, 44, 35, 72, 85, 80, 71, 70, 25])

        let preorderValues = tree.preorder().map { return $0.value }
        XCTAssertEqual(preorderValues, [25, 15, 10, 4, 12, 22, 18, 24, 70, 35, 31, 44, 71, 80, 72, 85])

        let levelorderValues = tree.levelOrder().map { return $0.value }
        XCTAssertEqual(levelorderValues, [25, 15, 70, 10, 22, 35, 71, 4, 12, 18, 24, 31, 44, 80, 72, 85])
    }

    func testDeleteMultipleInnerNode() {
        tree.delete(50)
        tree.delete(71)
        tree.delete(70)
        tree.delete(80)

        let inorderdValues = tree.inorder().map { return $0.value }
        XCTAssertEqual(inorderdValues.sorted(), inorderdValues)
        XCTAssertEqual(inorderdValues, [4, 10, 12, 15, 18, 22, 24, 25, 31, 35, 44, 72, 85])

        let postorderValues = tree.postorder().map { return $0.value }
        XCTAssertEqual(postorderValues, [4, 12, 10, 18, 24, 22, 15, 31, 35, 85, 72, 44, 25])

        let preorderValues = tree.preorder().map { return $0.value }
        XCTAssertEqual(preorderValues, [25, 15, 10, 4, 12, 22, 18, 24, 44, 35, 31, 72, 85])

        let levelorderValues = tree.levelOrder().map { return $0.value }
        XCTAssertEqual(levelorderValues, [25, 15, 44, 10, 22, 35, 72, 4, 12, 18, 24, 31, 85])
    }

    func testDeleteRootNode() {
        tree.delete(25)

        let inorderdValues = tree.inorder().map { return $0.value }
        XCTAssertEqual(inorderdValues.sorted(), inorderdValues)
        XCTAssertEqual(inorderdValues, [4, 10, 12, 15, 18, 22, 24, 31, 35, 44, 50, 70, 71, 72, 80, 85])

        let postorderValues = tree.postorder().map { return $0.value }
        XCTAssertEqual(postorderValues, [4, 12, 10, 18, 24, 22, 15, 44, 35, 72, 85, 80, 71, 70, 50, 31])

        let preorderValues = tree.preorder().map { return $0.value }
        XCTAssertEqual(preorderValues, [31, 15, 10, 4, 12, 22, 18, 24, 50, 35, 44, 70, 71, 80, 72, 85])

        let levelorderValues = tree.levelOrder().map { return $0.value }
        XCTAssertEqual(levelorderValues, [31, 15, 50, 10, 22, 35, 70, 4, 12, 18, 24, 44, 71, 80, 72, 85])
    }
}
