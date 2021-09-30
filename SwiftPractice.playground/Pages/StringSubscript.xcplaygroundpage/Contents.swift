//: [Previous](@previous)

import Foundation

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

var str = "Hello, playground"

let char = str[0]
print(char)

// without extension

let index = str.index(after: str.startIndex)
print(str[index])
