import Foundation
import Combine

/*
  Cancellable & AnyCancellable is type can be cancelled.
*/

//Timer that emits current time in every second
let timer = Timer.publish(every: 1, on: .current, in: .default).autoconnect()

//subscriber prints current time received in every second
let timerSubscriber: AnyCancellable = timer.sink { time in
    print(time)
}

//subscription will be cancelled after 5 seconds
Task {
    DispatchQueue.global(qos:.default).asyncAfter(deadline: .now() + 5) {
        timerSubscriber.cancel()
        print("Subscription is cancelled.")
    }
}
