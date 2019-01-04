//
//  RBBinarySearchTreeFindTests.swift
//  RBBinarySearchTreeTests
//
//  Created by Rahmi on 3.01.2019.
//  Copyright © 2019 rbozdag. All rights reserved.
//

import Foundation
import XCTest
@testable import RBBinarySearchTree

class BinarySearchTreeFindTests: XCTestCase {
   
    func testFindMin() {
        let tree = BinarySearchTree<Int>()
        XCTAssertNil(tree.findMin())
        
        tree.insert(100)
        XCTAssertEqual(tree.findMin()!.value, 100)
        
        tree.insert(110)
        XCTAssertEqual(tree.findMin()!.value, 100)
        
        tree.insert(130)
        XCTAssertEqual(tree.findMin()!.value, 100)
        
        tree.insert(90)
        XCTAssertEqual(tree.findMin()!.value, 90)
        
        tree.insert(140)
        XCTAssertEqual(tree.findMin()!.value, 90)
        
        tree.insert(80)
        XCTAssertEqual(tree.findMin()!.value, 80)
        
        tree.insert(10)
        XCTAssertEqual(tree.findMin()!.value, 10)
    }
    
    func testFindMax() {
        let tree = BinarySearchTree<Int>()
        XCTAssertNil(tree.findMax())
        
        tree.insert(100)
        XCTAssertEqual(tree.findMax()!.value, 100)
        
        tree.insert(110)
        XCTAssertEqual(tree.findMax()!.value, 110)
        
        tree.insert(130)
        XCTAssertEqual(tree.findMax()!.value, 130)
        
        tree.insert(90)
        XCTAssertEqual(tree.findMax()!.value, 130)
        
        tree.insert(140)
        XCTAssertEqual(tree.findMax()!.value, 140)
        
        tree.insert(80)
        XCTAssertEqual(tree.findMax()!.value, 140)
        
        tree.insert(10)
        XCTAssertEqual(tree.findMax()!.value, 140)
    }
    
}
