import Foundation
import Combine

/*
  Cancellable & AnyCancellable is type can be cancelled.
*/

//Timer that emits current time in every second
let timer = Timer.publish(every: 1, on: .current, in: .default).autoconnect()

//subscriber prints current time received in every second
let timerSubscription: AnyCancellable = timer.sink { time in
    print(time)
}

//subscription will be cancelled after 5 seconds
Task {
    DispatchQueue.global(qos:.default).asyncAfter(deadline: .now() + 5) {
        timerSubscription.cancel()
        print("Subscription is cancelled.")
    }
}
