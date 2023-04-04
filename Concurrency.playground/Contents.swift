import UIKit
import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

/*
var counter = 1


DispatchQueue.global(qos: .background).async {
       counter = 9
        print(9)
}

DispatchQueue.main.async {
    for i in 1...3 {
       counter = i
        print(counter)
    }
}

for i in 4...6 {
   counter = i
    print(counter)
}



DispatchQueue.global(qos: .background).async {
    for i in 1...10 {
        print(i)
    }
}

DispatchQueue.global(qos: .userInteractive).async {
    for i in 11...20 {
        print(i)
    }
}

let queue1 = DispatchQueue(label: "queue1", attributes: .concurrent)
let queue2 = DispatchQueue(label: "queue2", qos: .userInteractive, target: queue1)

queue1.async {
    for i in 1...5 {
        print(i)
    }
}

queue1.async {
    for i in 6...10 {
        print(i)
    }
}

queue2.async {
    for i in 11...15 {
        print(i)
    }
}

queue2.async {
    for i in 16...20 {
        print(i)
    }
}

*/

/*
let serialQueue = DispatchQueue(label: "serialQueue", attributes: .concurrent)

func doAsyncOnSerialQueue() {
    
    serialQueue.sync {
        for i in 1...3 {
            if Thread.isMainThread {
                print("Running on main thread")
            } else {
                print("Running on other thread")
            }
            print(i)
        }
    }
}

doAsyncOnSerialQueue()
serialQueue.async {
    for i in 5...10 {
     print(i)
    }
}

print("Last line in playground")



let dispGroup = DispatchGroup()

let q1 = DispatchQueue(label: "q1")

dispGroup.notify(queue: DispatchQueue.main) {
    print("both the task completed")
}

dispGroup.enter()
q1.async {
    print("hello q1 task1")
    dispGroup.leave()
}

dispGroup.enter()
DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
    print("hello q1 task 2")
    dispGroup.leave()
}
dispGroup.wait()
 


var workItem: DispatchWorkItem?

func callWorkItem() {
    workItem?.cancel()
    let wItem = DispatchWorkItem {
        for i in 5...10 {
         print(i)
        }
    }
    workItem = wItem
    DispatchQueue.global().asyncAfter(deadline: .now() + 1, execute: wItem)
}

for i in 1...5 {
    callWorkItem()
}

var arr = [1,2,3,4]
let dq = DispatchQueue(label: "myQ1", attributes: .concurrent)

dq.async(flags: .barrier, execute: {
    for i in 6...9 {
        arr.append(i)
    }
})

DispatchQueue.global().async(flags: .barrier) {
    arr.remove(at: 4)
}

dq.async(flags: .barrier, execute: {
    arr.append(15)
    print(arr)
})


private let concurrentQueue = DispatchQueue(label: "com.dispatchBarrier", attributes: .concurrent)
concurrentQueue.async {
    for value in 1...5 {
print("TASK I — async \(value)")
}
}
concurrentQueue.async {
    for value in 6...10 {
print("TASK II — sync \(value)")
}
}
for value in 11...15 {
concurrentQueue.async(flags: .barrier) {
print("TASK III — barrier \(value)")
}
}
concurrentQueue.async{
    for value in 16...20 {
print("TASK VI — async \(value)")
}
}

func callMain() {
    DispatchQueue.main.async {
        print("Main")
        DispatchQueue.main.async {
            print("Main inside Main")
        }
    }
}

callMain()
*/
var value = 0
func performUsingSemaphore() {
    let dq1 = DispatchQueue(label: "q1", attributes: .concurrent)
   // let dq2 = DispatchQueue(label: "q2", attributes: .concurrent)
    let semaphore = DispatchSemaphore(value: 1)
    _ = semaphore.wait(timeout: DispatchTime.distantFuture)
    for i in 1...3 {
        dq1.async {
            print("\(#function) DispatchQueue 1: \(i)")
            value = 1
            semaphore.signal()
        }
    }
//    for i in 1...3 {
//        dq2.async {
//            _ = semaphore.wait(timeout: DispatchTime.distantFuture)
//            print("\(#function) DispatchQueue 2: \(i)")
//            value = 2
//            semaphore.signal()
//        }
//    }
}

performUsingSemaphore()
RunLoop.current.run(mode: RunLoop.Mode.default,  before: Date(timeIntervalSinceNow: 1))
if value == 0 {
    print("Hello Task")
} else {
    print("Hello Task Non Zero")
}
