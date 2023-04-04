import UIKit

// Link list problems

class Node<T> {
    var next: Node?
    var val: T?
}



public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func createLinkListFrom(arr:[Int]) -> ListNode? {
    var head: ListNode?
    var current: ListNode?
    for i in 0..<arr.count {
        let node = ListNode(arr[i])
        if current != nil {
            current?.next = node
        }
        current = node
        if i == 0 {
            head = current
        }
    }
    return head
}

func printLinkList(head: ListNode?) {
    
     var current = head
   // print(current?.val ?? 0)
    while current != nil {
        if let val = current?.val {
            print(val)
        }
        current = current?.next
    }
}


printLinkList(head: ll)

// get middle node
func middleNode(_ head: ListNode?) -> ListNode? {
    var p1 = head
    var p2 = head
    
    while p2?.next != nil {
        p1 = p1?.next
        p2 = p2?.next?.next
    }
     return p1
}

let ll = createLinkListFrom(arr: [1,2,3,4,5,6])
middleNode(ll)

func insert(head: ListNode?, at index: Int, value: Int) {
    var current = head
    var i = 0
    while i < index - 1 {
        current = current?.next
        i += 1
    }
    let temp = current?.next
    let newNode = ListNode(value)
    current?.next = newNode
    newNode.next = temp
    
    printLinkList(head: head)
}

//insert(head: ll, at: 2, value: 9)


func delete(head:ListNode?, at index:Int) {
    
    var current = head
    var i = 0
    while i < index - 1 {
        current = current?.next
        i += 1
    }
    let temp = current?.next
    current?.next = temp?.next
    printLinkList(head: head)
}

//delete(head: ll, at: 1)

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    var hd = head
    var cur = hd
    var next = cur?.next
    var prev: ListNode? = nil
    
    while cur != nil {
        if cur?.val == val {
            if cur?.val == hd?.val {
                hd = hd?.next
                cur = hd
            } else {
                prev?.next = next
                cur = prev?.next
                next = cur?.next
            }
        } else {
            prev = cur
            cur = cur?.next
            next = cur?.next
        }
    }
    return hd
}

let arr = [1,2,2,1], val = 2
let l1 = createLinkListFrom(arr: arr)
let l2 = removeElements(l1, val)
//printLinkList(head: l2)

func deleteMiddle(_ head: ListNode?) -> ListNode? {
  var cur = head
  var cur2x = cur
    var prev: ListNode?
    while cur2x?.next != nil {
        prev = cur
        cur = cur?.next
        cur2x = cur2x?.next?.next
    }
    if head?.next == nil {
        return nil
    }
    prev?.next = cur?.next
    return head
}

//let l3 = [1,3,4,7,1,2,6]
//let a22 = [1, 2]
//let l3s = createLinkListFrom(arr: l3)
//let l3ss = deleteMiddle(l3s)
//printLinkList(head: l3ss)


func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var cur = head
    var fastN = head
    var prev: ListNode?
    var i = 1
    while fastN?.next != nil {
        if i >= n && cur?.next != nil {
            prev = cur
            cur = cur?.next
        }
        fastN = fastN?.next
        i += 1
    }
    if prev != nil {
        prev?.next = cur?.next
    } else {
        prev = cur?.next
        return prev
    }
    return head
}

//let list = removeNthFromEnd(l3s, 2)
//printLinkList(head: list)

// 1 -> 2 -> 3

// 1

// 1 -> 2 -> 3 -> 4 -> 5 -> 6 -> 7 -> 8 -> 9
func swapNodes(_ head: ListNode?, _ k: Int) -> ListNode? {
     var fastN = head
     var leftCurr = head
     var rightCurr = head
    // leftCurr and rigCurr will be swaped
     var i = 1
    while fastN?.next != nil {
        
        if i < k && leftCurr?.next != nil {
            leftCurr = leftCurr?.next
        }
        if i >= k && rightCurr?.next != nil {
            rightCurr = rightCurr?.next
        }
        fastN = fastN?.next
        i += 1
    }
    if let t1 = leftCurr?.val, let t2 = rightCurr?.val  {
        leftCurr?.val = t2
        rightCurr?.val = t1
    }
    return head
}
//let list = removeNthFromEnd(l3s, 2)
//printLinkList(head: list)
//let l3 = [1,3,4,7,1,2,6]
//let a22 = [1, 2]
//let l3s = createLinkListFrom(arr: l3)
//swapNodes(l3s, 4)
//printLinkList(head: l3s)


func reverseList(_ head: ListNode?) -> ListNode? {
    var prev: ListNode?
    var curr = head
    var next: ListNode?
    while curr != nil {
        next = curr?.next
        curr?.next = prev
        
        prev = curr
        curr = next
    }
    return prev
}

let l3 = [1,3,4,7,1,2,6]
let a22 = [1, 2]
let l3s = createLinkListFrom(arr: l3)
let tt = reverseList(l3s)
//printLinkList(head: tt)


func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
   var p1 = l1
   var p2 = l2
    var carry = 0
    var listCurrent: ListNode?
    var listHead: ListNode?
    while p1 != nil || p2 != nil {
        var val1 = 0, val2 = 0
        if let v = p1?.val {
            val1 = v
        }
        if let v = p2?.val {
            val2 = v
        }
        let sum = val1 + val2 + carry
        if sum >= 10 {
            carry = sum / 10
        }
        let sumWithoutCarry = sum % 10
        let listN = ListNode(sumWithoutCarry)
        if listCurrent == nil {
            listCurrent = listN
            listHead = listN
        } else {
            listCurrent?.next = listN
            listCurrent = listCurrent?.next
        }
        p1 = p1?.next
        p2 = p2?.next
    }
    return listHead
}

let l1111 = [2,4,3], l2222 = [5,6,4]

let lis1 = createLinkListFrom(arr: l1111)
let lis2 = createLinkListFrom(arr: l2222)
let lis3 = addTwoNumbers(lis1, lis2)

printLinkList(head: lis3)

let dd = 6 << 3
 // 8/2 = 4/2 = 2/2 = 1/2 
