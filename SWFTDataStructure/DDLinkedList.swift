//
//  DDLinkedList.swift
//  example
//
//  Created by jufan wang on 2020/9/2.
//  Copyright © 2020 jufan wang. All rights reserved.
//

/*
 Sequence { IteratorProtocol  }
 Collection { Sequence { IteratorProtocol } ,  Indexable}
 双向遍历集合 BidirectionalCollection { Collection }
 随机访问集合 RandomAccessCollection { Collection }
 可变结合 MutableCollection { Collection }
 RangeReplaceableCollection  { Collection }
 */

import Foundation

typealias DDLinkedStack = DDLinkedList;

public class DDLinkedList<T> {
    
    public var head: DDLinkedNode<T>?;
    public var tail: DDLinkedNode<T>?;
    
    required public init() {
    }
    
    public var isEmpty: Bool {
        return head == nil;
    }
    public func node(at index: Int) -> DDLinkedNode<T>? {
        var counter = 0;
        var cur = head;
        while cur != nil && counter < index {
            counter += 1;
            cur = cur!.next;
        }
        return cur;
    }

    public func push(_ value: T) {
        head = DDLinkedNode(value: value, next: head);
        if tail == nil {
            tail = head;
        }
    }
    public func append(_ value: T) {
        guard !isEmpty else {
            push(value);
            return;
        }
        tail!.next = DDLinkedNode(value: value);
        tail = tail!.next;
    }
    @discardableResult
    public func insert(_ value: T, after node: DDLinkedNode<T>?) -> DDLinkedNode<T>? {
        guard tail !== node else {//Identity Operators  !== ===
            append(value);
            return tail!;
        }
        node!.next = DDLinkedNode(value: value, next: node?.next);
        return node!.next;
    }
    
    @discardableResult
    public func pop() -> T? {
        defer {
            head = head?.next;
            if isEmpty {
                tail = nil;
            }
        }
        return head?.value;
    }
    @discardableResult
    public func removeLast() -> T? {
        guard let head = head else {
            return nil;
        }
        guard head.next != nil else {
            return pop();
        }
        var chead : DDLinkedNode<T>? = head;
        while chead?.next !== tail {
            chead = chead!.next;
        }
        defer {
            tail = chead;
            tail!.next = nil;
        }
        return tail!.value;
    }
    public func remove(after node: DDLinkedNode<T>?) -> T? {
        defer {
            if node?.next === tail {
                tail = node;
            }
            node?.next = node?.next?.next;
        }
        return node?.next?.value;
    }
    
    //private
    @discardableResult
    public func replace(at index: Int, with node: DDLinkedNode<T>?) -> DDLinkedNode<T>? {
        if index == 0 {
            node?.next = head?.next;
            defer {
                if head === tail {
                    tail = node;
                }
                head = node;
            }
            return head;
        }
        
        var cindex = 0;
        var phead = head;
        while cindex+1 < index {
            phead = phead?.next;
            cindex += 1;
        }
        defer {
            node?.next = phead?.next?.next;
            phead?.next = node;
        }
        return node?.next;
    }
}

extension DDLinkedList: CustomStringConvertible {
    public var description: String {
        guard let head = head else {
            return "Empty list !";
        }
        return String(describing: head);
    }
}

/*
 iterator
 */
public struct DDLinkedListIterator<T>: IteratorProtocol {
    public typealias Element = DDLinkedNode<T>;
    var head: DDLinkedNode<T>?;
    public init(_ linkedList: DDLinkedList<T>) {
        head = linkedList.head;
    }
    public mutating func next() -> DDLinkedNode<T>? {
        defer {
            head = head?.next;
        }
        return head;
    }
}
extension DDLinkedList: Sequence {
    public typealias Element = DDLinkedNode<T>;
    public typealias Iterator = DDLinkedListIterator<T>;
    __consuming public func makeIterator() -> Iterator {
        return DDLinkedListIterator(self);
    }
}

extension DDLinkedList: Collection, RandomAccessCollection, MutableCollection, RangeReplaceableCollection {
    public typealias Index = Int;

    public func index(after i: Int) -> Int {
        let counter = count();
        precondition(i >= 0, "out of bounds");
        precondition(i < counter, "out of bounds");
        return i + 1;
    }
    
    public subscript(position: Int) -> DDLinkedNode<T> {
        get {
            precondition(position >= 0, "out of bounds");
            precondition(position < count(), "out of bounds");
            var cnode: DDLinkedNode? = node(at: position);
            if (cnode == nil) {
                cnode = DDLinkedNode<T>();
            }
            return cnode!;
        }
        
        set(newValue) {
            replace(at: position, with: newValue);
        }
    }
    
    public var startIndex: Int {
        return 0;
    }
    
    public var endIndex: Int {
        return count() - 1;
    }
    
    private func count() -> Int {
        var count = 0;
        var chead = head;
        while (chead != nil) {
            count += 1;
            chead = chead?.next;
        }
        return count;
    }
    
    public func replaceSubrange<C>(_ subrange: Range<DDLinkedList.Index>, with newElements: __owned C) where C : Collection, DDLinkedList.Element == C.Element {
        precondition(subrange.lowerBound >= 0, "out of bounds");
        precondition(subrange.upperBound <= count(), "out of bounds");
        
        if head === tail {
            head = newElements.first;
            tail = head;
            return;
        }
        
        var ite = newElements.makeIterator();
        var chead = newElements.first;
        while let lhead = ite.next(){
            chead?.next = lhead;
            chead = lhead;
        }
        
        let onode = node(at: subrange.upperBound);
        chead?.next = onode;
        if onode == nil {
            tail = chead;
        }
        if subrange.lowerBound == 0 {
            head = newElements.first;
        } else {
            let pre = node(at: subrange.lowerBound - 1);
            pre?.next = newElements.first;
        }
    }
    
}

