import Foundation

func countCharacters(_ words: [String], _ chars: String) -> Int  {
    var freqDict: [Character: Int] = [:]
    var count = 0

    for char in chars   {
        if  freqDict[char] == nil   {
            freqDict[char] = 1
        }
        else {
            freqDict[char]! += 1
        }
    }
    
    for word in words   {
        var tempFreqDict = freqDict
        var currentWordCount = 0
        for char in word    {
            if tempFreqDict[char] != 0 && tempFreqDict[char] != nil    {
                tempFreqDict[char]! -= 1
                currentWordCount += 1
            }
            else    {
                currentWordCount = 0
                break
            }
        }
        count += currentWordCount
    }
    
    print(freqDict)
    print(count)
    return count
}

countCharacters(["hello","world","leetcode"], "welldonehoneyr")

let testString = "factorial"
let testarr = [""]
let testIntArr: [Int] = [Int]()

print(testString.count)

for (index, element) in testString.enumerated() {
    if index % 2 == 0   {
        print(element)
    }
}

