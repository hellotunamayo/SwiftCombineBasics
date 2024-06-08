import Foundation
import Combine

/*
    PassthroughSubject
    1. Doesn't have initial value
    2. Subscriber can receive values from the publisher starting from the point they subscribe
*/

//First generic type is type be published.
//Second one is error type.
//If error is unnecesary, just put Never on it.
let publisher = PassthroughSubject<Int, Never>()

//First subscriber
let subscriber1: AnyCancellable = publisher.sink { integer in
    print("integer1 is: \(integer)")
}

publisher.send(123) //First subscriber prints 123

//Second subscriber
let subscriber2 = publisher.sink { integer in
    print("integer2 is: \(integer)")
}

publisher.send(456) //both of subscriber prints 456
publisher.send(789) //both of subscriber prints 789

/*
 The result is:
 integer1 is: 123
 integer1 is: 456
 integer2 is: 456
 integer1 is: 789
 integer2 is: 789
*/
