//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
//Majority Element

func removeZerosHigherOrder(arr: [Int]) -> [Int] {
    return arr.filter{$0 != 0} + Array(repeating: 0, count: arr.reduce(0){$1 == 0 ? $0 + 1 : $0})
}

func majorityElement<T: Hashable>(_ nums: [T]) -> T? {
    var frequencyDict = [T:Int]()
    for num in nums {
        frequencyDict[num] = (frequencyDict[num] ?? 0) + 1
        if frequencyDict[num]! > nums.count / 2 {
            return num
        }
    }
    return nil
}

//https://leetcode.com/problems/house-robber/#/description
//class TreeNode {
//    var money: Int = 0
//    var left: TreeNode?
//    var right: TreeNode?
//    init(money:Int) {
//        self.money = money
//    }
//    func convertArrToTrees(_ nums: [Int]) -> (TreeNode, TreeNode) {
//        let nodeOne = TreeNode(money:nums[0])
//        nodeOne.left = TreeNode(money: nums[2])
//        nodeOne.right = TreeNode(money: nums[3])
//        
//        nodeOne.left.left = TreeNode(money: nums[4])
//    }
//    func rob(_ nums:[Int]) -> Int {
//        
//    }
//}

//https://leetcode.com/problems/house-robber/#/solutions
//DP O(N) time, O(1) space with easy to understand explanation
//For every house k, there are two options: either to rob it (include this house: i) or not rob it (exclude this house: e).
//
//Include this house:
//i = num[k] + e (money of this house + money robbed excluding the previous house)
//
//Exclude this house:
//e = max(i, e) (max of money robbed including the previous house or money robbed excluding the previous house)
//(note that i and e of the previous step, that's why we use tmp here to store the previous i when calculating e, to make O(1) space)
//
//Here is the code:
//public class Solution {
//    public int rob(int[] num) {
//    int i = 0;
//    int e = 0;
//    for (int k = 0; k<num.length; k++) {
//    int tmp = i;
//    i = num[k] + e;
//    e = Math.max(tmp, e);
//    }
//    return Math.max(i,e);
//    }
//}

func rob(_ nums: [Int]) -> Int {
    var a = 0
    var b = 0
    for i in 0..<nums.count {
        if i % 2 == 0 {
            a = max(a + nums[i], b)
        } else {
            b = max(a, b + nums[i])
        }
    }
    return max(a, b)
}

rob([1,5,1,4,5,6,7,8])
/*
//This does not work!  Also is probably a bad idea.  but here it is for reference.
class Node {
    var money: Int
    var nextHouses = [Node]()
    init(money: Int) {
        self.money = money
    }
}

class Solution {
    func convertToGraph(_ nums: [Int]) -> (Node, Node) {
        let startNodeOne = Node(money: nums[0])
        for indexOne in 2..<nums.count {
            let newNode = Node(money: nums[indexOne])
            guard indexOne + 2 < nums.count else {
                continue
            }
            for indexTwo in (indexOne + 2)..<nums.count {
                newNode.nextHouses.append(Node(money: (nums[indexTwo])))
            }
            startNodeOne.nextHouses.append(newNode)
        }
        let startNodeTwo = Node(money: nums[1])
        
        for indexOne in 3..<nums.count {
            let newNode = Node(money: nums[indexOne])
            guard indexOne + 2 < nums.count else {
                continue
            }
            for indexTwo in (indexOne + 2)..<nums.count {
                newNode.nextHouses.append(Node(money: (nums[indexTwo])))
            }
            startNodeTwo.nextHouses.append(newNode)
        }
        return (startNodeOne, startNodeTwo)
    }
    var maxSum = 0
    func findMax(_ node: Node, _ currentSum: Int) {
        //printGraph(node)
        for nextHouse in node.nextHouses {
            findMax(nextHouse, currentSum+node.money)
        }
        if currentSum > maxSum {
            maxSum = currentSum
        }
    }
    func maxWrapper(_ node: Node) -> Int {
        //printGraph(node)
        findMax(node, 0)
        return maxSum
    }
    func rob(_ nums: [Int]) -> Int {
        let (nodeOne, nodeTwo) = convertToGraph(nums)
        dump(nodeOne)
        dump(nodeOne.nextHouses[0])
        dump(nodeOne.nextHouses[0].nextHouses[0])
        let maxOne = maxWrapper(nodeOne)
        //let maxTwo = maxWrapper(nodeTwo)
        //return maxOne > maxTwo ? maxOne : maxTwo
        return -1
    }
    func printGraph(_ inputNode: Node) {
        print("Current node: \(inputNode.money)")
        for node in inputNode.nextHouses {
            print("Adjacent node: \(node.money)")
            print("Its adjacent nodes \(node.nextHouses.map{$0.money})")
        }
        print("")
    }
}
*/

func firstSingleChar(str: String) -> String? {
    guard str.characters.count > 1 else { return nil }
    var array = [Character]()
    var dict = [Character: Int]()
    for c in str.characters {
        if dict[c] == nil {
            array.append(c)
        }
        dict[c] = (dict[c] ?? 0) + 1
        
    }
    for c in array {
        if dict[c] == 1 {
            return String(c)
        }
    }
    return nil
}

firstSingleChar(str: "aardvark")

//nth(at index: Int) -> Int?

//nthFromLast(at index: Int) -> Int?
