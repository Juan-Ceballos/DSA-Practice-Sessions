import UIKit

struct Stack <T> {
    var arr = [T]()

    mutating func push(_ newElement: T)  {
        arr.append(newElement)
    }

    mutating func pop() -> T?  {
        return arr.popLast()
    }

    func peek() -> T?  {
        return arr.last
    }

    func isEmpty() -> Bool  {
        return arr.isEmpty
    }

    func count() -> Int  {
        return arr.count
    }
}

var openBracket: [Character:Character] = ["(": ")", "{": "}", "[": "]"]
var validChar: [Character] = ["(",")","{","}","[","]"]

func isBalanced(s: String) -> String {

    var stack = Stack<Character>()
    
    if s.count % 2 == 1 {
        return "NO"
    }
    
    if s.isEmpty == true    {
        return "NO"
    }

    for char in s   {

        if validChar.contains(char) {

            for (key, value) in openBracket {
                
                if char == key  {
                    stack.push(char)
                }
                
                else if char == value {
                    if let nonEmptyStack = stack.peek() {
                        if openBracket[nonEmptyStack] == value {
                        stack.pop()
                        }
                        
                        else {
                            return "NO"
                        }
                    }
                    
                }

            }
        }

        else    {
            return "NO"
        }
        
    }
    
    if stack.isEmpty()  {
       return "YES"
    }
    
    else    {
        return "NO"
    }

}

let y = isBalanced(s: "{[(])}")

func findMaxLength(_ nums: [Int]) -> Int {
    var count = 0
    var maxLength = 0
    var freqDict: [Int: Int] = [0: -1]
    for (currentIndex, num) in nums.enumerated() {
        if num == 0 {
            count -= 1
        }
        else {
            count += 1
        }
        if let firstSeenIndex = freqDict[count] {
            maxLength = max(maxLength, currentIndex - firstSeenIndex)
        }
        else {
            freqDict[count] = currentIndex
        }
    }
    return maxLength
}

findMaxLength([0, 1])


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    
}
 
var firstNode = ListNode(0)
var secondNode = ListNode(1)
var thirdNode = ListNode(2)
var fouthNode = ListNode(3)

firstNode.next = secondNode
secondNode.next = thirdNode
thirdNode.next = fouthNode

func reverseList(_ head: ListNode?) -> ListNode?  {
    // head is a ListNode
    // ListNode has value, val
    // ListNode has next of type ListNode
    
    var currentNode = head
    var previous: ListNode?
    var next: ListNode?
    
    while currentNode != nil   {
        next = currentNode?.next
        currentNode?.next = previous
        previous = currentNode
        currentNode = next
    }
    
    return previous
}

reverseList(firstNode)

var x = [String: (String, Int)]()

struct Word: Hashable {
    let word: String
    let number: Int
}

var wordDict = [Word: Word]()
var tupleTest = (0, 1)
tupleTest.0 += 1
print(tupleTest.0)
