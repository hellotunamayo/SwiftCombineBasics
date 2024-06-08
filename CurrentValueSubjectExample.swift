import Foundation
import Combine

/*
  CurrentValueSubject
  1. Can have initial value
  2. Subscriber can receive values immediately upon subscribing
  3. Subscriber receives value automatically whenever Publisher emits new value
*/

let publisher = CurrentValueSubject<Int, Never>(100) //100 is initial value

//First Subscriber
let subscriber1: AnyCancellable = publisher.sink { integer in
    print("integer1 is: \(integer)") //The initial value 100 is print once at this point
}

publisher.send(200) //Subscriber1 prints 200 the updated value 200

//Second Subscriber
let subscriber2 = publisher.sink { integer in
    print("integer2 is: \(integer)") //Subscriber2 printss 200 the initial value at subscription point
}

publisher.send(300) //All Subscribers print 300

/*
 The result is:
 integer1 is: 100
 integer1 is: 200
 integer2 is: 200
 integer1 is: 300
 integer2 is: 300
*/
