import UIKit

class TreeNode {
    var left: TreeNode?
    var right: TreeNode?
    var val: Int
    init(val: Int) {
        self.val = val
    }
}

struct Queue<T> {
    var array = [T]()
    
    var isEmpty: Bool {
        return array.isEmpty
    }

    var size: Int {
        return array.count
    }

    mutating func enqueue(_ element: T?) {
        guard let ele = element else { return }
        array.append(ele)
    }

    mutating func dequeue() -> T? {
        return array.removeFirst()
    }
}

// height of binary tree

func maxDepth(_ root: TreeNode?) -> Int {
    if root == nil { return 0 }
        let lh = 1 + maxDepth(root?.left)
        let rh = 1 + maxDepth(root?.right)
        return max(lh, rh)
}

let root = TreeNode(val: 1)
let l1 =  TreeNode(val: 2)
let r1 = TreeNode(val: 3)
let r2 = TreeNode(val: 4)
let r3 = TreeNode(val: 5)
let r4 = TreeNode(val: 6)
let r5 = TreeNode(val: 4)
//root.left = l1
r1.right = r2
r2.right = r3
r3.right = r4
r4.right = r5
root.right = r1

let vv = maxDepth(root)

func minDepth(_ root: TreeNode?) -> Int {
        if root == nil {return 0}
        let lh = 1 + minDepth(root?.left)
        let rh = 1 + minDepth(root?.right)
    return min(lh > 1 ? lh : rh, rh)
}
let vvv = minDepth(root)
