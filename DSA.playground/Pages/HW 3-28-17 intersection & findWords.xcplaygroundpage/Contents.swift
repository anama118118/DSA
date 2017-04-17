//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//https://leetcode.com/problems/intersection-of-two-arrays/#/description
let array = [1,2,3,4,5,6]
let set = Set<Int>(array)

func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    let set1 = Set<Int>(nums1)
    let set2 = Set<Int>(nums2)
    set1.intersection(nums2)
    return Array(set1.intersection(set2))
}

intersection([1,2,3,4,5,6], [0])

//Ask clarifying questions
//How do we handle negative numbers?
//How should we order the return array?

//Identify inputs and outputs
//Input: [Int], [Int]
//Output: [Int]

//3) Thal through a solution
//Turn both arrays into sets, then returned the intersection of both sets.
//[Not Set] Iterate through an input array, and for each value, check to see if the second array contains that value. If it does and the final array doesn't yet contain that value, append it to the final array.

//4) Code and explain your solution
func intersection2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    return Array(Set(nums1).intersection(Set(nums2)))
}

func intersection3(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var nums = [Int]()
    for num in nums1 {
        if nums2.contains(num) {
            nums.append(num)
        }
    }
    return Array(Set((nums)))
}


//https://leetcode.com/problems/keyboard-row/#/description
//Are we clarifying question
//Iterate through each word in our array.
//Iterate through each characters in each word, and check to see if they are all on the same row. If so, append the string to a final array. If not, continue. Return the final array
func findWords(_ words: [String]) -> [String] {
    let row1 = Set<Character>(arrayLiteral: "q","w","e","r","t","y","u","i","o","p")
    let row2 = Set<Character>(arrayLiteral: "a","s","d","f","g","h","j","k","l")
    let row3 = Set<Character>(arrayLiteral: "z","x","c","v","b","n","m")
    
    //let dictionary = ["q": 1,"w": 1,"e": 1,"r": 1,"t": 1,"y": 1,"u": 1,"i": 1,"o":1,"p": 1,"a": 2,"s": 2,"d": 2,"f": 2,"g": 2,"h": 2,"j": 2,"k": 2,"l": 2,"z": 3,"x": 3,"c": 3,"v": 3,"b": 3,"n": 3, "m": 3]
    
    return words.filter {
        let letterSet = Set($0.lowercased().characters)
        return letterSet.isSubset(of: row1) || letterSet.isSubset(of: row2) || letterSet.isSubset(of: row3)
    }
    //return words.filter { Set($0.lowercased().characters).isSubset(of: row1) || Set($0.lowercased().characters).isSubset(of: row2) || Set($0.lowercased().characters).isSubset(of: row3) }
}

func findWords2(_ words: [String]) -> [String] {
    let row1 = Set<Character>(arrayLiteral: "q","w","e","r","t","y","u","i","o","p")
    let row2 = Set<Character>(arrayLiteral: "a","s","d","f","g","h","j","k","l")
    let row3 = Set<Character>(arrayLiteral: "z","x","c","v","b","n","m")
    var finalArr = [String]()
    
    for word in words {
        let firstLetter = word.lowercased()[word.startIndex]
        var shouldAppend = true
        switch firstLetter {
        case _ where row1.contains(firstLetter):
            for c in word.lowercased().characters {
                if !row1.contains(c){
                    shouldAppend = false
                }
            }
            if shouldAppend {
                finalArr.append(word)
            }
        case _ where row2.contains(firstLetter):
            for c in word.lowercased().characters {
                if !row2.contains(c){
                    shouldAppend = false
                }
            }
            if shouldAppend {
                finalArr.append(word)
            }
        case _ where row3.contains(firstLetter):
            for c in word.lowercased().characters {
                if !row3.contains(c){
                    shouldAppend = false
                }
            }
            if shouldAppend {
                finalArr.append(word)
            }
        default:
            if shouldAppend {
                finalArr.append(word)
            }
        }
    }
        return finalArr
}
func findWords3(_ words: [String]) -> [String] {
    let row1 = Set<Character>(arrayLiteral: "q","w","e","r","t","y","u","i","o","p")
    let row2 = Set<Character>(arrayLiteral: "a","s","d","f","g","h","j","k","l")
    let row3 = Set<Character>(arrayLiteral: "z","x","c","v","b","n","m")
    var finalArr = [String]()
    var shouldAppend = true
    
    func allCharsIn(row: Set<Character>, with word: String) -> Bool {
        var shouldAppend = true
        for c in word.lowercased().characters {
            if !row.contains(c){
                shouldAppend = false
            }
        }
        return shouldAppend
    }
    
    for word in words {
        let firstLetter = word.lowercased()[word.startIndex]
        switch firstLetter {
        case _ where row1.contains(firstLetter):
           shouldAppend = allCharsIn(row: row1, with: word)
        case _ where row2.contains(firstLetter):
            shouldAppend = allCharsIn(row: row2, with: word)
        case _ where row3.contains(firstLetter):
            shouldAppend = allCharsIn(row: row3, with: word)
        default:
            if shouldAppend {
                finalArr.append(word)
            }
        }
    }
    return finalArr
}


