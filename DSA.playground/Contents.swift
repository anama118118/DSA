//: Playground - noun: a place where people can play

import UIKit

// Reverse a String
/* Clarifying questions
 1) Can we use higher ordered functions?
 2) Can I use .reversed()?
 3) How do I handle whitespace and punctuation?
 */

/* Identify inputs and outputs
 1)
 Input: String
 Output: String
 
 2)
 Input: String
 Output: Void
 
 3)
 Input: Void (By extending the struct)
 Output: Void
 */

/* Give an explanation in words
    1)
    Iterate through each character in the String, from the last character to the first
 
    Put each character in an empty array of characters
 
    Convert this array of characters into a String, then return it.
 
    2) Iterate through each character in the string, from the first character to the last.
    
    Push each character onto a Stack of characters
    
    Create a string by popping each character off and adding to the end of the string.
 
    Then return the String
 
 */

func reverseString(str: String) -> String {
    var myStack: [Character] = []
    for c in str.characters{
        myStack.append(c)
    }
    var revseredStr = ""
    while !myStack.isEmpty {
        revseredStr += String(myStack.popLast()!)
        //revseredStr.append(myStack.popLast()!)
    }
    return revseredStr
}
