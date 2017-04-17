//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)


//string to count the number of values in the string
//use map
func countTheNumberOfVowelsIn(_ str: String) -> Int {
    return ( str.characters.map({ (c: Character) -> Bool in
        return c == "a" || c == "e" || c == "i" || c == "o" || c == "u"
    }).filter({ (b: Bool) -> Bool in
        b == true
    }).count)
}

countTheNumberOfVowelsIn("aeiouabc")

// Use reduce
//func countTheNumberOfVowelsInReduce(_ str: String) -> Int {
//    return str.characters.reduce(0, { (count: Int, c) -> Int in
//        if c == "a" || c == "e" || c == "i" || c == "o" || c == "u" {
//            return 1
//        }
//    })
//}

//function get string make first's letter capitalize
//func makeFirstLetterCapitalized(_ str: String) -> String {
//    str.characters.map({ (c: Character) -> Bool in
//        if str[str.index(str.startIndex, offsetBy: 1)] == c {
//            return Character(String(c).capitalized == c)
//        }
//    })
//    return ""
//}
