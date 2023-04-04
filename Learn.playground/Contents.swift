import UIKit

// SOLID principal in practical



// 1- SRP: Single Responsiblity Principal

class DataHandler {
    
//    func getData() -> Data {
//        // get data from API
//        Data()
//    }
//
//    func parseData(data: Data) {
//        // parsing data in to objects
//    }
//
//    func saveToDatabase() {
//        // saving to local DB
//    }
}


func getSum(a: Int, b: Int, closure:(Int) -> Void) {
    DispatchQueue.main.async { in 
        closure(a+b)
    }
}

let ss: (Int)-> Void = { res in
    print("Result is: \(res)")
}

getSum(a: 2, b: 4, closure: ss)
