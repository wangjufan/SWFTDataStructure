//
//  DDBinaryTreeNodeTest.swift
//  exampleTests
//
//  Created by jufan wang on 2020/9/16.
//  Copyright © 2020 jufan wang. All rights reserved.
//

import XCTest

import Foundation
@testable import example

class DDBinaryTreeNodeTest: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testInOrder() {
        let bnode = DDBinaryTreeNode(value: 4);
        let fleft = DDBinaryTreeNode(value: 2);
        let frigth = DDBinaryTreeNode(value: 3);
        bnode.leftChild = fleft;
        bnode.rigthChild = frigth;
        
        let fleft2 = DDBinaryTreeNode(value: 5);
        let frigth2 = DDBinaryTreeNode(value: 6);
        fleft.leftChild = fleft2;
        fleft.rigthChild = frigth2;
        
        let frigth3 = DDBinaryTreeNode(value: 7);
        frigth2.rigthChild = frigth3;

        let fleft22 = DDBinaryTreeNode(value: 25);
        let frigth22 = DDBinaryTreeNode(value: 26);
        frigth.leftChild = fleft22;
        frigth.rigthChild = frigth22;

        let frigth33 = DDBinaryTreeNode(value: 86);
        frigth22.rigthChild = frigth33;
        
        print("=======");
        bnode.traverseInOrder(visitor: { (value) -> (Void) in
            print(value);
        });
        print("=======");
        bnode.traversePreOrder(visitor: { (value) -> (Void) in
            print(value);
        });
        print("=======");
        bnode.traversePostOrder(visitor: { (value) -> (Void) in
            print(value);
        });
        print("=======");
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
