//
//  DDLinkedNodeTest.swift
//  exampleTests
//
//  Created by jufan wang on 2020/9/2.
//  Copyright © 2020 jufan wang. All rights reserved.
//

import Foundation

import XCTest
@testable import example

class DDLinkedNodeTest: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testDDLinkedNode() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let node1 = DDLinkedNode(value: 1);
        let node2 = DDLinkedNode(value: 2);
        let node3 = DDLinkedNode(value: 3);
        node1.next = node2;
        node2.next = node3;
        print(node1);
    }
    
    func testDDLinkedList() {
        var list = DDLinkedList<Int>();
        list.push(1);
        list.push(2);
        list.push(3);
        print(list);
        
        if isKnownUniquelyReferenced(&list) {
            print("sdf");
        }
        let list2 = list;
        list.push(11);
        list2.push(22);
        print(list);
        print(list2);
    }
    
    func testDDLinkedList_Insert() {
        let list = DDLinkedList<Int>();
        list.push(1);
        list.push(2);
        list.push(3);
        let node = list.node(at: 0);
        print(node ?? "nil");
        list.insert(22, after: node);
        print(list);
    }
    
    func testDDLinkedList_Pop() {
        let list = DDLinkedList<Int>();
        list.push(1);
        list.push(2);
        list.push(3);
        list.pop();
        print(list);
    }
    
    func testDDLinkedList_RemoveLast() {
        let list = DDLinkedList<Int>();
        list.push(1);
//        list.push(2);
//        list.push(3);
        let value = list.removeLast();
        print(value!);
        print(list);
    }
    
    func testDDLinkedList_RemoveAfter() {
        let list = DDLinkedList<Int>();
//        list.push(1);
//        list.push(2);
//        list.push(3);
        print(list);
        let node = list.node(at: 0);
        let value = list.remove(after: node);
//        print(value!);
        print(list);
    }
    
    func testDDLinkedList_Iterator() {
        let list = DDLinkedList<Int>();
        list.push(1);
        list.push(2);
        list.push(3);
        print(list);
        
        var iterator = list.makeIterator();
        while let node = iterator.next() {
            print(node)
        }
        
        iterator = list.makeIterator();
        while let node = iterator.next() {
            print(node)
        }
        
        //        print(value!);
        print(list);
    }
    
    func testDDLinkedList_Collection() {
        var list = DDLinkedList<Int>();
        list.push(1);
        list.push(2);
        list.push(3);
        print(list);
        //        print(value!);
        let node = DDLinkedNode(value: 22);
        
        list[1] = node;
        print(list);
        print(list[1]);
        print(list[0]);
        print(list[2]);
        
    }
    
    func testDDLinkedList_Range() {
        let list = DDLinkedList<Int>();
        list.push(1);
        list.push(2);
        list.push(3);
        print(list);
        
        var rlist = Array<DDLinkedNode<Int>>();
        rlist.append(DDLinkedNode(value: 31));
        list.replaceSubrange(1..<2, with: rlist);
        print(list);
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
