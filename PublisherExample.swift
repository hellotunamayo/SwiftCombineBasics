import Foundation
import Combine

//publisher
let publisher = [0,1,2,3,4,5].publisher

//subscriber receives value that emitted from publisher and prints even numbers.
let subscription = publisher
    .filter {
        $0 % 2 == 0 //filtering even number from received value
    }
    .sink { intValue in
        print("\(intValue)")
    }
