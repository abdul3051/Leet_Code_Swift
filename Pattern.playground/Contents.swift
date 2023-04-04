import UIKit

/*
 
 ******
 *----*
 *----*
 *----*
 *----*
 ******
 
 */
let n = 5
for i in 1...n {
    for j in 1...n {
        if i == 1 || i == n {
            print("*", terminator: "")
        } else {
            if j == 1 || j == n {
                print("*", terminator: "")
            } else {
                print(" ", terminator: "")
            }
        }
    }
    print("")
}

print("")
print("")

/*
 
----*----
---*-*---
--*-*-*--
-*-*-*-*-
*-*-*-*-*
 
 */

for i in 0...n {
    let m = n * 2
    let numOfStarToPrint = i
    for j in 0...m {
        let leftP = (m/2) - i
        let rightP = (m/2) + i
        if j >= leftP, j <= rightP {
            
            print("*", terminator: "")
        } else {
            print(" ", terminator: "")
        }
    }
    print("")
}

print("")
print("")

/*
 
     *
    * *
   *   *
  *     *
 *       *
* * * * * *
 
 */
for i in 0...n {
    let m = n * 2
    for j in 0...m {
        let leftP = (m/2) - i
        let rightP = (m/2) + i
        if j == leftP || j == rightP {
            print("*", terminator: "")
        } else if i == n {
            if j % 2 == 0 {
                print("*", terminator: "")
            } else {
                print(" ", terminator: "")
            }
        } else {
            print(" ", terminator: "")
        }
    }
    print("")
}
