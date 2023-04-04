import UIKit

/*
Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.

The overall run time complexity should be O(log (m+n)).

 

Example 1:

Input: nums1 = [1,3], nums2 = [2]
Output: 2.00000
Explanation: merged array = [1,2,3] and median is 2.
Example 2:

Input: nums1 = [1,2], nums2 = [3,4]
Output: 2.50000
Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
*/


func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    
    var i = 0, j = 0
    var arr = [Int]()
    let n = nums1.count
    let m = nums2.count
    while i < n && j < m {
        if nums1[i] < nums2[j] {
            arr.append(nums1[i])
            i += 1
        } else if nums2[j] < nums1[i] {
            arr.append(nums2[j])
            j += 1
        } else {
            arr.append(nums1[i])
            arr.append(nums2[j])
            i += 1
            j += 1
        }
    }
    while i < n {
        arr.append(nums1[i])
        i += 1
    }
    while j < m {
        arr.append(nums2[j])
        j += 1
    }
    print(arr)
    let count = arr.count
    if count % 2 == 0 {
        return Double(Double(arr[(count/2)] + arr[(count/2) - 1])/2.0)
    } else {
        return Double(arr[(count/2)])
    }
}

let nums1 = [1,2]
let nums2 = [3,4,7,8]

let tt = findMedianSortedArrays(nums1, nums2)

func setZeros(row: Int, col: Int, matrix: inout [[Int]]) {
    
}

func setZeroes(_ matrix: inout [[Int]]) {
    let n = matrix[0].count, m = matrix.count
    var i = 0
    while i < n {
        var j = 0
        while j < m {
            if matrix[i][j] == 0 {
                setZeros(row: i, col: j, matrix: &matrix)
                i += 1
                break
            }
            j += 1
        }
        i += 1
    }
}


var arr = [[1,1,1],[1,0,1],[1,1,1]]

setZeroes(&arr)
