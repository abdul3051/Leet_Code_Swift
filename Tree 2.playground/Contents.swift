import UIKit

class TreeNode {
    var left: TreeNode?
    var right: TreeNode?
    var val: Int
    init(val: Int) {
        self.val = val
    }
}

func inOrder(_ root: TreeNode?, resultArr: inout [Int]) {
    guard let node = root else {return}
    
    inOrder(node.left, resultArr: &resultArr)
    resultArr.append(node.val)
    inOrder(node.right, resultArr: &resultArr)
}

func inorderTraversal(_ root: TreeNode?) -> [Int] {
     var result = [Int]()
     inOrder(root, resultArr: &result)
    return result
}

func postOrder(_ root: TreeNode?, resultArr: inout [Int]) {
    guard let node = root else {return}
    
    inOrder(node.left, resultArr: &resultArr)
    inOrder(node.right, resultArr: &resultArr)
    resultArr.append(node.val)
}

func postorderTraversal(_ root: TreeNode?) -> [Int] {
     var result = [Int]()
     inOrder(root, resultArr: &result)
    return result
}

func preOrder(_ root: TreeNode?, resultArr: inout [Int]) {
    guard let node = root else {return}
   
    resultArr.append(node.val)
    preOrder(node.left, resultArr: &resultArr)
    preOrder(node.right, resultArr: &resultArr)
}

func preorderTraversal(_ root: TreeNode?) -> [Int] {
     var result = [Int]()
    preOrder(root, resultArr: &result)
    return result
}


struct Queue<T> {
     var array = [T]()
     var size: Int {
        return array.count
     }
    
    var isEmpty: Bool {
        return array.isEmpty
    }

    mutating func enque(element: T?) {
         guard let ele = element else {return}
         array.append(ele)
     }

    mutating func dequeue() -> T? {
         return array.removeLast()
     }
 }

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let node = root else { return [] }
    var queue = Queue<TreeNode>()
    var resultArr = [[Int]]()
    queue.enque(element: node)
    
    while !queue.isEmpty {
        let size = queue.size
        var arr = [Int]()
        for _ in 0..<size {
            if let node1 = queue.dequeue() {
                arr.append(node1.val)
                queue.enque(element: node1.left)
                queue.enque(element: node1.right)
            }
        }
        resultArr.append(arr)
    }
    return resultArr
}

struct Stack<T> {
    private var array = [T]()
    
    var top: T? {
        return array.last
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    mutating func push(_ element: T?) {
        guard let element = element else { return }
        array.append(element)
    }
   
    @discardableResult
    mutating func pop() -> T? {
        return array.removeLast()
    }
}

func inorderItrative(node: TreeNode?) -> [Int] {
    var stack = Stack<TreeNode>()
    var inorderResult = [Int]()
    stack.push(node)
    while !stack.isEmpty {
        if let top = stack.top {
            if let left  = top.left {
                stack.push(left)
            } else {
                inorderResult.append(top.val)
                stack.pop()
                stack.push(top.right)
            }
        }
    }
    return inorderResult
}


func preorderItrative(node: TreeNode?) -> [Int] {
    var stack = Stack<TreeNode>()
    var preorderResult = [Int]()
    stack.push(node)
    while !stack.isEmpty {
        if let top = stack.pop() {
            preorderResult.append(top.val)
            stack.push(top.right)
            stack.push(top.left)
        }
    }
    return preorderResult
}

func inorderItrative(_ node: TreeNode?) -> [Int] {
    var stack = Stack<TreeNode>()
    var inorderResult = [Int]()
    var pNode = node?.left
    stack.push(node)
    while !stack.isEmpty || pNode != nil {
        if pNode != nil {
          stack.push(pNode)
          pNode = pNode?.left
        } else {
          let popN = stack.pop()
          if let val = popN?.val {
             inorderResult.append(val)
          }
          pNode = popN?.right
        }
    }
    return inorderResult
}

func postOrderItrative(node: TreeNode?) -> [Int] {
    var stack = Stack<TreeNode>()
    var preorderResult = [Int]()
    stack.push(node)
    while !stack.isEmpty {
        if let top = stack.pop() {
            preorderResult.insert(top.val, at: 0)
            stack.push(top.left)
            stack.push(top.right)
        }
    }
    return preorderResult
}

