//
//  DDBinaryTreeNode.swift
//  example
//
//  Created by jufan wang on 2020/9/16.
//  Copyright © 2020 jufan wang. All rights reserved.
//

import Foundation

public class DDBinaryTreeNode<Element>: Equatable {
    public static func == (lhs: DDBinaryTreeNode<Element>, rhs: DDBinaryTreeNode<Element>) -> Bool {
        let pl = Unmanaged<AnyObject>.passUnretained(lhs as AnyObject).toOpaque();
        let pr = Unmanaged<AnyObject>.passUnretained(rhs as AnyObject).toOpaque()
        return pl.hashValue == pr.hashValue;
    }
    public var value: Element;
    public var leftChild: DDBinaryTreeNode?;
    public var rigthChild: DDBinaryTreeNode?;
    public init(value: Element) {
        self.value = value;
    }
}

extension DDBinaryTreeNode {
    public func traverseInOrderRecursion(visitor visit: (Element) -> (Void)) {
        leftChild?.traverseInOrderRecursion(visitor: visit);
        visit(value);
        rigthChild?.traverseInOrderRecursion(visitor: visit);
    }
    
    public func traverseInOrder(visitor visit: (Element) -> (Void)) {
        let stack: DDLinkedList<DDBinaryTreeNode<Element>> = DDLinkedList<DDBinaryTreeNode<Element>>();
        var cnode: DDBinaryTreeNode<Element>? = self;
        repeat {
            let left: (DDBinaryTreeNode<Element>)? = cnode!.leftChild;
            if (left == nil) {
                //visit all middle node without right child
                //and a middle node with right child
                visit(cnode!.value);
                cnode = cnode?.rigthChild;
                while (cnode == nil && !stack.isEmpty) {
                    cnode = stack.pop();
                    visit(cnode!.value);
                    cnode = cnode?.rigthChild;
                }
            } else {//to left most
                stack.push(cnode!);
                cnode = left;
            }
        }while cnode != nil;
    }
    
    public func traversePreOrder(visitor visit: (Element) -> (Void)) {
        let stack: DDLinkedList<DDBinaryTreeNode<Element>> = DDLinkedList<DDBinaryTreeNode<Element>>();
        var cnode: DDBinaryTreeNode<Element>? = self;
        repeat {
            visit(cnode!.value);
            let left: (DDBinaryTreeNode<Element>)? = cnode!.leftChild;
            if (left == nil) {
                cnode = cnode?.rigthChild;
                while (cnode == nil && !stack.isEmpty) {
                    cnode = stack.pop();
                    cnode = cnode?.rigthChild;
                }
            } else {
                stack.push(cnode!);
                cnode = left;
            }
        }while cnode != nil;
    }
    
    public func traversePostOrder(visitor visit: (Element) -> (Void)) {
        let stack: DDLinkedStack<DDBinaryTreeNode<Element>> = DDLinkedStack<DDBinaryTreeNode<Element>>();
        var cnode: DDBinaryTreeNode<Element>? = self;
        var pre: DDBinaryTreeNode<Element>? = nil;
        repeat {
            var left: (DDBinaryTreeNode<Element>)? = cnode!.leftChild;
            while (left != nil
                && left != pre
                && cnode?.rigthChild != pre) {
                stack.push(cnode!)
                cnode = left;
                left = cnode!.leftChild;
            }
            let right: (DDBinaryTreeNode<Element>)? = cnode!.rigthChild;
            if (right != nil
                && right != pre) {
                stack.push(cnode!);
                cnode = right;
            } else {
                visit(cnode!.value);
                pre = cnode;
                cnode = stack.pop();
            }
        }while cnode != nil;
    }
}









