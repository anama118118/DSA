//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//https://leetcode.com/problems/add-two-numbers/#/description
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var prev = ListNode(0)
        var head = prev
        var carry: Int = 0
        var ll1 = l1
        var ll2 = l2
        while ll1 != nil || ll2 != nil || carry != 0 {
            var currentNode = ListNode(0)
            let sum = (ll1?.val ?? 0) + (ll2?.val ?? 0) + carry
            carry = sum % 10
            currentNode.val = sum % 10
            
            prev.next = currentNode
            prev = currentNode
            
            ll1 = ll1 ?? ll1?.next
            ll2 = ll2 ?? ll2?.next
        }
        return head.next
    }
}

//https://leetcode.com/problems/median-of-two-sorted-arrays/#/description
func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    let arr = (nums1 + nums2).sorted()
    if arr.count % 2 == 1 {
        return Double(arr[arr.count / 2])
    } else {
        return (Double(arr[(arr.count / 2) - 1]) + Double(arr[(arr.count / 2)]))/2
    }
}

//https://leetcode.com/problems/hamming-distance/#/solutions
//461. Hamming Distance
func hammingDistance(_ x: Int, _ y: Int) -> Int {
    let num = pow(Double(x), Double(y))
    var counter = 0
    for c in String(Int(num), radix: 2).characters {
        if c == "1" {
            counter += 1
        }
    }
    return counter
}

//500. Keyboard Row
//https://leetcode.com/problems/keyboard-row/#/description
//3 sets of the characters that are in the same row
//loop through the array of words
//check if the word contains only the character in the same row

func findWords(_ words: [String]) -> [String] {
    let row1 = Set<Character>(arrayLiteral: "q","w","e","r","t","y","u","i","o","p")
    let row2 = Set<Character>(arrayLiteral: "a","s","d","f","g","h","j","k","l")
    let row3 = Set<Character>(arrayLiteral: "z","x","c","v","b","n","m")
    var arrayToReturn = [String]()
    for word in words {
        let letterSet = Set<Character>(word.lowercased().characters)
        if letterSet.isSubset(of: row1) {
            arrayToReturn.append(word)
        } else if letterSet.isSubset(of: row2) {
            arrayToReturn.append(word)
        } else if letterSet.isSubset(of: row3) {
            arrayToReturn.append(word)
        }
    }
    return arrayToReturn
}

func findWords2(_ words: [String]) -> [String] {
    let row1 = Set<Character>(arrayLiteral: "q","w","e","r","t","y","u","i","o","p")
    let row2 = Set<Character>(arrayLiteral: "a","s","d","f","g","h","j","k","l")
    let row3 = Set<Character>(arrayLiteral: "z","x","c","v","b","n","m")
    return words.filter{
        let letterSet = Set<Character>($0.lowercased().characters)
        return letterSet.isSubset(of: row1) || letterSet.isSubset(of: row2) || letterSet.isSubset(of: row3)
    }
}

