// Cameron Spickert (cspickert@gmail.com)
// C4Q Mock Interviews at Google NYC
// April 5, 2017

// 1. Write a function that takes a string as input and returns the first unique character in the string.

// Edward's implementation
func firstUniqueCharacter(in string: String) -> Character? {
  var char: Character? = nil
  for (index1, char1) in string.characters.enumerated() {
    char = char1
    for (index2, char2) in string.characters.enumerated() {
      if index1 != index2 {
        if char1 == char2 {
          char = nil
          break
        }
      }
    }
    if char != nil {
      return char
    }
  }
  return char
}

firstUniqueCharacter(in: "")
firstUniqueCharacter(in: "aaa")
firstUniqueCharacter(in: "aardvark")

// 2. Design a singly linked list in Swift. Add a method that returns the nth element in the list. Update your implementation (or add another method) that returns the nth-to-last element in the list.

class LinkedListNode<T> {
  var value: T
  var next: LinkedListNode<T>?

  init(value: T) {
    self.value = value
  }
}

class LinkedList<T> {
  var head: LinkedListNode<T>?

  init(head: LinkedListNode<T>) {
    self.head = head
  }

  func value(at index: Int) -> T? {
    var nodeIndex = 0
    if nodeIndex == index {
      return head?.value
    }
    var nodeHead = head
    while let next = nodeHead?.next {
      nodeIndex += 1
      if nodeIndex == index {
        return next.value
      }
      nodeHead = next
    }
    return nil
  }

  func value(fromEndOfListAt index: Int) -> T? {
    // ???
    return nil
  }
}

let node1 = LinkedListNode(value: 1)
let node2 = LinkedListNode(value: 2)
let node3 = LinkedListNode(value: 3)

node1.next = node2
node2.next = node3

let list = LinkedList(head: node1)
list.value(at: 1)
list.value(at: 10)
list.value(fromEndOfListAt: 0)
list.value(fromEndOfListAt: 1)
