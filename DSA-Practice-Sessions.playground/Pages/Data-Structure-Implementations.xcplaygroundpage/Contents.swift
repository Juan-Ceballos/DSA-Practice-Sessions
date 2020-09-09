//: [Previous](@previous)

import Foundation

// Implement Stack, Nodes, Linked List, Queues

//
//=========================STACK==================
//

struct Stack<T> {
    var arr: [T] = []
    
    // peak, push, pop, isEmpty
    
    var isEmpty: Bool {
        return arr.isEmpty
    }
    
    mutating func peek() -> T?    {
        return arr.last
    }
    
    mutating func push(value: T)    {
        arr.append(value)
    }
    
    mutating func pop() -> T? {
        return arr.popLast()
    }
    
}

extension Stack: CustomStringConvertible {
    public var description: String {
    
        guard !isEmpty else { return "Stack is empty." }
    
        return arr.map{ "\($0)" }.reversed().joined(separator: "\n") + " ← Bottom"
    }
}

var newStack = Stack<Int>()
newStack.push(value: 0)
newStack.push(value: 1)
newStack.push(value: 2)

print(newStack)

//
//=======================NODE, LINKEDLIST============================================
//

class Node<T> {
    var value: T
    var next: Node?
    
    init(value: T) {
        self.value = value
    }
    
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else  {
            return "\(value) -> nil" // 12 -> nil
        }
        // if we have connected nodes
        return "\(value) -> \(next)"
    }
}

var node1 = Node<Int>(value: 0)
var node2 = Node(value: 1)
var node3 = Node(value: 2)

node1.next = node2
node2.next = node3

print(node1)

struct LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    // list functions, append, removeLast, first, last, isEmpty
    
    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Node<T>? {
        return head
    }
    
    var last: Node<T>? {
        return tail
    }
    
    // append tail end insertion
    mutating func append(value: T)  {
        let newNode = Node(value: value)

        if isEmpty {
            head = newNode
            tail = newNode
        } else {
            tail?.next = newNode
            tail = newNode
        }
    }
}

extension LinkedList: CustomStringConvertible   {
    var description: String {
        guard let head = head
        else    {
            return "empty list"
        }
        return "\(head)"
    }
}

var list = LinkedList<Int>()
list.append(value: 3)
print(list)
list.append(value: 2)
print(list)
