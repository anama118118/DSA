//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//https://leetcode.com/problems/plus-one/
func plusOne(_ digits: [Int]) -> [Int] {
    var arrayToReturn = [Int]()
    var addOneToNext = false
    for (index, digit) in digits.reversed().enumerated() {
        var digitToAppend = digit
        print(index)
        if index == 0 {
            digitToAppend = digitToAppend + 1
        }
        if addOneToNext {
            digitToAppend = digitToAppend + 1
            addOneToNext = false
        }
        if digitToAppend > 9 {
            digitToAppend = 0
            addOneToNext = true
        }
        arrayToReturn.append(digitToAppend)
    }
    if addOneToNext {
        arrayToReturn.append(1)
    }
    return arrayToReturn.reversed()
}

plusOne([1,2,3])

//https://leetcode.com/problems/sort-characters-by-frequency/#/description
func frequencySort(_ s: String) -> String {
    var dict = [Character: Int]()
    var string = ""
    for c in s.characters {
        dict[c] = (dict[c] ?? 0) + 1
    }
    let sorted = dict.sorted{$0.value > $1.value}
    for tuple in sorted {
        let c = String(repeating: String(tuple.key), count: tuple.value)
        string = string + c
    }
    return string
}
frequencySort("tree")