import UIKit

var greeting = "Hello, playground"

/*Given an array nums, return true if the array was originally sorted in non-decreasing order, then rotated some number of positions (including zero). Otherwise, return false.
 
 There may be duplicates in the original array.

 Note: An array A rotated by x positions results in an array B of the same length such that A[i] == B[(i+x) % A.length], where % is the modulo operation.

  

 Example 1:

 Input: nums = [3,4,5,1,2]
 Output: true
 Explanation: [1,2,3,4,5] is the original sorted array.
 You can rotate the array by x = 3 positions to begin on the the element of value 3: [3,4,5,1,2].
*/
func check(_ nums: [Int]) -> Bool {
      var count = 0
      let n = nums.count
    for i in 0..<n {
        if nums[i] > nums[((i+1) % n)] {
            count += 1
        }
    }
    return count <= 1
}

let nums = [3,4,5,2,1,2]
check(nums)

func removeDuplicates(_ nums: inout [Int]) -> Int {
    var i = 1
    var numOfDups = 0
    while i < nums.count {
        if nums[i] == nums[i - 1] {
            nums.remove(at: i)
            numOfDups += 1
        } else {
            i += 1
        }
    }
    return numOfDups
   }

func removeDuplicates2(_ nums: inout [Int]) -> Int {

    var numOfDups = 0
    var i = 0, j = 1
    while j < nums.count  {
        if nums[i] != nums[j] {
            i = j
            j += 1
        } else {
            nums.remove(at: j)
            numOfDups += 1
        }
    }
    return numOfDups
}


var arr = [1,1,2]

removeDuplicates2(&arr)
print(arr)

func moveZeroes(_ nums: inout [Int]) {
    var nonZPos = 0
    var i = 0
    while i < nums.count {
        if nums[i] != 0 {
            nums[nonZPos] = nums[i]
            nonZPos += 1
        }
        i += 1
    }
    while nonZPos < nums.count {
        nums[nonZPos] = 0
        nonZPos += 1
    }
 }

var a = [0,1,0,3,12]
moveZeroes(&a)
print(a)


func unionOf(_ arr1: [Int],_ arr2: [Int]) -> [Int] {
    var arrUnion = [Int]()
    let n = arr1.count, m = arr2.count
    var i = 0, j = 0
    let min = n < m ? n : m
    while i < min || j < min {
        if arr1[i] == arr2[j] {
            arrUnion.append(arr1[i])
            i += 1
            j += 1
        } else if arr1[i] < arr2[j] {
            if (arrUnion.last != arr1[i]) {
                arrUnion.append(arr1[i])
            }
            i += 1
        } else {
            if (arrUnion.last != arr2[j]) {
                arrUnion.append(arr2[j])
            }
            j += 1
        }
    }
    while i < n {
        if (arrUnion.last != arr1[i]) {
            arrUnion.append(arr1[i])
        }
        i += 1
    }
    
    while j < m {
        if (arrUnion.last != arr2[j]) {
            arrUnion.append(arr2[j])
        }
        j += 1
    }
    
    return arrUnion
}

let arr1 = [1,2,3,4,5]
let arr2 = [2,3,4,4]

let ua = unionOf(arr1, arr2)
print(ua)

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    
    var i = 0, j = 0
    while i < n + m && j < m {
        if nums2[j] <= nums1[i] {
            nums1.insert(nums2[j], at: i)
        } else {
            if i + 1 < n + m {
                nums1.insert(nums2[j], at: i + 1)
            }
        }
        j += 1
        i += 2
    }
}

var nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
merge(&nums1, m, nums2, n)


func intersectionOf(_ arr1: [Int],_ arr2: [Int]) -> [Int] {
    var arrInterS = [Int]()
    let n = arr1.count, m = arr2.count
    var i = 0, j = 0
    let min = n < m ? n : m
    while i < min || j < min {
        if arr1[i] == arr2[j] {
            arrInterS.append(arr1[i])
            i += 1
            j += 1
        } else if arr1[i] < arr2[j] {
            i += 1
        } else {
            j += 1
        }
    }
    return arrInterS
}

let aa = intersectionOf(arr1, arr2)


func missingNumber(_ nums: [Int]) -> Int {
    var sum = 0
    for num in nums {
        sum += num
    }
    let n = nums.count
    return (n * (n + 1))/2 - sum
}

let aaa = missingNumber([3,0,1])


func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
    var i = 0
    var max = 0, count = 0
    while i < nums.count {
        if nums[i] == 1 {
            count += 1
        } else {
            count = 0
        }
        if count > max {
            max = count
        }
        i += 1
    }
    return max
}

let dd = [1,1,0,1,1,1]
//findMaxConsecutiveOnes(dd)


func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]()
    for i in 0..<nums.count {
        let val = target - nums[i]
        if let index = dict[nums[i]] {
            return [index, i]
        } else {
            dict[val] = i
        }
    }
    return []
}

let a2 = [2,7,11,15]

let c = twoSum(a2, 13)


func twoSumSorted(_ numbers: [Int], _ target: Int) -> [Int] {
    var i = 0, j = numbers.count - 1
    while i < j {
        if numbers[i] + numbers[j] == target {
            return [i+1, j+1]
        } else if numbers[i] + numbers[j] < target {
            i += 1
        } else {
            j -= 1
        }
    }
    return []
}

let v = twoSumSorted(a2, 13)


func addBinary(_ a: String, _ b: String) -> String {
    let arrStr1 = Array(a)
    let arrStr2 = Array(b)
    var i = arrStr1.count - 1
    var j = arrStr2.count - 1
    
    var carry = 0
    var str: String = ""
    
    while i >= 0 || j >= 0 || carry > 0 {
        var val1 = 0
        var val2 = 0
        if i >= 0, let v = arrStr1[i].wholeNumberValue  {
            val1 = v
        }
        if j >= 0, let v = arrStr2[j].wholeNumberValue {
            val2 = v
        }
        var sum = val1 + val2 + carry
        carry = 0
        if sum > 1 {
            carry = sum / 2
        }
        sum = sum % 2
        let c: Character = Character(String(sum))
        str.insert(c, at: str.startIndex)
        i -= 1
        j -= 1
    }
    return str
}

let str1 = "10"
let str2 = "11"
let s3 = addBinary(str1, str2)
