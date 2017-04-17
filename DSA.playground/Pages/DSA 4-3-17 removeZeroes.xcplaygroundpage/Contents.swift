//: [Previous](@previous)

import Foundation

//https://leetcode.com/problems/move-zeroes/#/description
//http://www.geeksforgeeks.org/move-zeroes-end-array/

//Given an array nums, write a function to move all 0's to the end of it while maintaining the relative order of the non-zero elements.

//For example, given nums = [0, 1, 0, 3, 12], after calling your function, nums should be [1, 3, 12, 0, 0].

func removeZeroes(_ nums: inout [Int]) {
    var arr: [Int] = []
    var arrZeros: [Int] = []
    for n in nums {
        if n == 0 {
           arrZeros.append(n)
        } else {
            arr.append(n)
        }
    }
    nums = arr + arrZeros
}
var num = [0, 1, 0, 3, 12]
removeZeroes(&num)

func removeZeros2(_ nums: inout [Int]){
    let counter = nums.count
    let c = nums.filter { (n: Int) -> Bool in
        return n != 0
    }
    let zeroArr = Array(repeating: 0, count: counter - c.count)
    nums = c + zeroArr
}
var num2 = [0, 1, 0, 3, 12]
removeZeros2(&num2)

func removeZeros3(_ nums: inout [Int]){
    var zeroFinderIndex = 0
    var numberFinderIndex = 0
    while zeroFinderIndex < nums.count && numberFinderIndex < nums.count - 1 {
        if nums[zeroFinderIndex] == 0 {
            numberFinderIndex += 1
            if nums[numberFinderIndex] != 0 {
                swap(&nums[zeroFinderIndex], &nums[numberFinderIndex])
            }
        } else {
            zeroFinderIndex += 1
        }
    }
}

var num3 = [0, 1, 0, 3, 12]
removeZeroes(&num3)

/*
//iterate through the array
//for each value, if it is zero, append it to one array
//if it is nonzero, append it to a different array
//return the nonzero array + the zero array


func removeZeros(arr: [Int]) -> [Int] {
    var zeroArr = [Int]()
    var nonZeroArr = [Int]()
    for value in arr {
        if value == 0 {
            zeroArr.append(value)
        } else {
            nonZeroArr.append(value)
        }
    }
    return nonZeroArr + zeroArr
}

func removeZerosHigherOrder(arr: [Int]) -> [Int] {
    var zeroCount = 0
    for num in arr {
        if num == 0 {
            zeroCount += 1
        }
    }
    return arr.filter{$0 != 0} + Array(repeating: 0, count: zeroCount)
}

func removeZerosTwo(arr: inout [Int]) {
    var zeroFinderIndex = 0
    var numberFinderIndex = 0
    while zeroFinderIndex < arr.count && numberFinderIndex < arr.count - 1 {
        if arr[zeroFinderIndex] == 0 {
            numberFinderIndex += 1
            if arr[numberFinderIndex] != 0 {
                swap(&arr[zeroFinderIndex], &arr[numberFinderIndex])
            }
        } else {
            zeroFinderIndex += 1
        }
    }
}

var testArr = [1,0,0,0,0,1]

removeZerosTwo(arr: &testArr)
*/
