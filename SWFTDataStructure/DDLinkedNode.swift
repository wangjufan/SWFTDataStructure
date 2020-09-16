//
//  DDLinkedNode.swift
//  example
//
//  Created by jufan wang on 2020/9/2.
//  Copyright © 2020 jufan wang. All rights reserved.
//

import Foundation


public class DDLinkedNode<T> {
    public var value: T?;//careless its value in node
    public var next: DDLinkedNode?;//optional , may be nil
    public init(value: T?, next: DDLinkedNode? = nil) {
        self.value = value;
        self.next = next;
    }
    public init() {
        self.value = nil;
        self.next = nil;
    }
}

extension DDLinkedNode: CustomStringConvertible {
    public var description: String {
        guard let next = next else {
            return "\(value!)";
        }
        return "\(value!) -> " + String(describing: next) + "";
    }
}
