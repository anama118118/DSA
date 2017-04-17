//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)

//https://leetcode.com/problems/relative-ranks/#/description
//Clearification Question
//Are the scores unique

func findRelativeRanks(_ nums: [Int]) -> [String] {
    var rankingDict = [Int: String]()
    let sorted = nums.sorted(by:>)
    for i in 0..<sorted.count {
        switch i {
        case 0:
            rankingDict[sorted[i]] = "Gold Medal"
        case 1:
            rankingDict[sorted[i]] = "Silver Medal"
        case 2:
            rankingDict[sorted[i]] = "Bronze Medal"
        default:
            rankingDict[sorted[i]] = "\(i+1)"
        }
    }
    var finalArr = [String]()
    for num in nums {
        finalArr.append(rankingDict[num]!)
    }
    return finalArr
}
findRelativeRanks([1,2,3,4,5,6,7])