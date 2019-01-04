//
//  RBBinarySearchTreeTests.swift
//  RBBinarySearchTreeTests
//
//  Created by Rahmi on 3.01.2019.
//  Copyright © 2019 rbozdag. All rights reserved.
//

import XCTest
@testable import RBBinarySearchTree

class BinarySearchTreeTests: XCTestCase {
    
    func testTreeHeight() {
        let tree = BinarySearchTree<Int>()
        XCTAssertEqual(tree.height, 0)

        tree.insert(50)
        XCTAssertEqual(tree.height, 1)

        tree.insert(60)
        XCTAssertEqual(tree.height, 2)

        tree.insert(70)
        XCTAssertEqual(tree.height, 3)

        tree.insert(80)
        XCTAssertEqual(tree.height, 4)

        tree.insert(40)
        XCTAssertEqual(tree.height, 4)

        tree.insert(30)
        XCTAssertEqual(tree.height, 4)

        tree.insert(20)
        XCTAssertEqual(tree.height, 4)

        tree.insert(10)
        XCTAssertEqual(tree.height, 5)

        tree.insert(5)
        XCTAssertEqual(tree.height, 6)

        tree.insert(90)
        XCTAssertEqual(tree.height, 6)

        tree.insert(100)
        XCTAssertEqual(tree.height, 6)

        tree.insert(110)
        XCTAssertEqual(tree.height, 7)

        tree.insert(120)
        XCTAssertEqual(tree.height, 8)
    }

    func testTreeMaxDepth() {
        let tree = BinarySearchTree<Int>()
        XCTAssertEqual(tree.maxDepth, 0)

        tree.insert(50)
        XCTAssertEqual(tree.maxDepth, tree.height)

        tree.insert(60)
        XCTAssertEqual(tree.maxDepth, tree.height)

        tree.insert(70)
        XCTAssertEqual(tree.maxDepth, tree.height)

        tree.insert(80)
        XCTAssertEqual(tree.maxDepth, tree.height)

        tree.insert(40)
        XCTAssertEqual(tree.maxDepth, tree.height)

        tree.insert(30)
        XCTAssertEqual(tree.maxDepth, tree.height)

        tree.insert(20)
        XCTAssertEqual(tree.maxDepth, tree.height)

        tree.insert(10)
        XCTAssertEqual(tree.maxDepth, tree.height)

        tree.insert(5)
        XCTAssertEqual(tree.maxDepth, tree.height)

        tree.insert(90)
        XCTAssertEqual(tree.maxDepth, tree.height)

        tree.insert(100)
        XCTAssertEqual(tree.maxDepth, tree.height)

        tree.insert(110)
        XCTAssertEqual(tree.maxDepth, tree.height)

        tree.insert(120)
        XCTAssertEqual(tree.maxDepth, tree.height)
    }

    func testTreeMinDepth() {
        let tree = BinarySearchTree<Int>()
        XCTAssertEqual(tree.minDepth, 0)

        tree.insert(50)
        XCTAssertEqual(tree.minDepth, 1)

        tree.insert(60)
        XCTAssertEqual(tree.minDepth, 2)

        tree.insert(70)
        XCTAssertEqual(tree.minDepth, 3)

        tree.insert(80)
        XCTAssertEqual(tree.minDepth, 4)

        tree.insert(40)
        XCTAssertEqual(tree.minDepth, 2)

        tree.insert(30)
        XCTAssertEqual(tree.minDepth, 3)

        tree.insert(20)
        XCTAssertEqual(tree.minDepth, 4)

        tree.insert(10)
        XCTAssertEqual(tree.minDepth, 4)

        tree.insert(5)
        XCTAssertEqual(tree.minDepth, 4)

        tree.insert(90)
        XCTAssertEqual(tree.minDepth, 5)

        tree.insert(100)
        XCTAssertEqual(tree.minDepth, 6)

        tree.insert(110)
        XCTAssertEqual(tree.minDepth, 6)

        tree.insert(120)
        XCTAssertEqual(tree.minDepth, 6)
    }
    
}
