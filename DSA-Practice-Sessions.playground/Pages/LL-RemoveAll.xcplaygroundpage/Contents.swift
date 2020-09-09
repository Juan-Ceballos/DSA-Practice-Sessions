//: [Previous](@previous)

import Foundation

// implement Nodes for...
// implement Linked List

class Node<ElementType> {
    // nodes have a value, and next which is node
    var value: ElementType
    var next: Node?
    
    init(value: ElementType) {
        self.value = value
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value) -> nil"
        }
        
        return "\(value) -> \(next)"
    }
}

struct LinkedList<ElementType: Comparable> {
    var head: Node<ElementType>?
    var tail: Node<ElementType>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating public func append(value: ElementType) {
        let newNode = Node(value: value)
        if isEmpty {
            head = newNode
            tail = head
        }
        
        else {
            tail?.next = newNode
            tail = newNode
        }
    }
    
    mutating public func removeAll(value: ElementType) {
        while let currentHead = head, currentHead.value == value {
            head = head?.next
        }
        
        var prev = head
        var current = head?.next
        
        while let currentNode = current {
            guard currentNode.value != value else {
                prev?.next = currentNode.next
                current = prev?.next
                continue
            }
            
            prev = current
            current = current?.next
        }
        
        tail = prev
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "empty list"
        }
        
        return "\(head)"
    }
}

var list = LinkedList<Int>()
list.append(value: 0)
list.append(value: 1)
list.append(value: 2)
list.append(value: 2)
list.append(value: 3)

print(list)

list.removeAll(value: 2)
print(list)
