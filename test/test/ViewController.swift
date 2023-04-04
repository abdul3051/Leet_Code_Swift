//
//  ViewController.swift
//  test
//
//  Created by Abdul Rahman Khan on 18/03/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let str1 = "1010"
//        let str2 = "1011"
//        let s3 = addBinary(str1, str2)
        let a = 3
        let b = 2
        let result = addWithoutPlus(a, b)
        print(result) //
    }
    
    func addWithoutPlus(_ a: Int, _ b: Int) -> Int {
        var sum = a
        var carry = b
        
        while carry != 0 {
            let temp = sum & carry // 011 * 010 = 010
            sum = sum ^ carry      // 011 * 010 = 001
            
            carry = temp << 1
            
        }
        return sum
    }
    
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
}

