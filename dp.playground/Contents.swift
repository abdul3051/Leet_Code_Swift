
func maxSubArraySum(_ arr: [Int]) -> Int {
    var max_so_far = arr[0]
    var max_ending_here = arr[0]
    
    for i in 1..<arr.count {
        max_ending_here = max(arr[i], max_ending_here + arr[i])
        max_so_far = max(max_so_far, max_ending_here)
    }
    
    return max_so_far
}

let arr = [-2, -1, -3, -7]
let maxSum = maxSubArraySum(arr)
print("Maximum sum of subarray is: \(maxSum)")
