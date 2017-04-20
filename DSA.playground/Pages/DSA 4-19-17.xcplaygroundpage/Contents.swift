//: [Previous](@previous)

import Foundation

var str = "Hello, playground"

//: [Next](@next)
class TreeNode {
    let val: Int
    var left: TreeNode?
    var right: TreeNode?
    init (val: Int) {
        self.val = val
    }
}

//Sum all nodes in BT
func dfs (_ node: TreeNode?) -> Int {
    //base case
    guard let node = node else {
        return 0
    }
    //recursive call
    return node.val + dfs(node.left) + dfs(node.right)
}

//Sum all nodes in BT left node
func dfsLeftSum (_ node: TreeNode?, _ isLeft: Bool = false) -> Int {
    //base case
    guard let node = node else {
        return 0
    }
    //recursive call
    return (isLeft ? node.val : 0) + dfsLeftSum(node.left, true) + dfsLeftSum(node.right, false)
}

//depth first search = pre-order, in-order, post-order
//breath first search

//Do this without a recursive structure
//Build a stack

//Do it return a linkedList
//Follow up question, return a linked list

let tree = TreeNode(val: 10)
tree.left = TreeNode(val: 8)
tree.right = TreeNode(val: 15)

func dfsIterPreOrder(_ node: TreeNode) -> Int {
    var stack: [TreeNode?] = [node]
    var sum = 0
    
    while !stack.isEmpty {
        let newNode = stack.popLast()!
        guard let unwrapped = newNode else {
            continue
        }
        sum += (unwrapped.val)
        stack.append(unwrapped.left)
        stack.append(unwrapped.right)
    }
    
    return sum
}

func dfsIterPreOrder2(_ node: TreeNode) -> Int {
    var stack: [TreeNode] = [node]
    var sum = 0
    
    while !stack.isEmpty {
        let newNode = stack.popLast()!
        sum += (newNode.val)
        if newNode.left != nil {
            stack.append(newNode.left!)
        }
        if newNode.right != nil {
            stack.append(newNode.right!)
        }
    }
    return sum
}

func dfsIterInOrder(_ node: TreeNode) -> Int {
    var stack: [TreeNode?] = [node]
    var sum = 0
    
    while !stack.isEmpty {
        let newNode = stack.popLast()!
        guard let unwrapped = newNode else {
            continue
        }
        stack.append(unwrapped.left)
        sum += (unwrapped.val)
        stack.append(unwrapped.right)
    }
    return sum
}

func dfsIterPostOrder(_ node: TreeNode) -> Int {
    var stack: [TreeNode?] = [node]
    var sum = 0
    
    while !stack.isEmpty {
        let newNode = stack.popLast()!
        guard let unwrapped = newNode else {
            continue
        }
        stack.append(unwrapped.left)
        stack.append(unwrapped.right)
        sum += (unwrapped.val)
    }
    return sum
}



//Pre order, printing the the left the right things doesn't matter
//put in stack = [TreeNode(10)]
//sum = 0

//newNode = 10
//sum = 10
//stack = [TreeNode(8), TreeNode(15)]

//newNode = 15
//sum = 10 + 15
//stack = [TreeNode(8). TreeNode(12), TreeNode(16)]

//newNode = 16
//sum = 10 + 15 + 16
//stack = [TreeNode(8). TreeNode(12)]

//newNode = 12
//sum = 10 + 15 + 16 + 12
//stack = [TreeNode(8)]


//newNode = 8
//sum = 10 + 15 + 16 + 12 + 8
//stack = [TreeNode(7) + TreeNode(9)]

//newNode = 9
//sum = 10 + 15 + 16 + 12 + 8 + 9 + 7
//stack = []
