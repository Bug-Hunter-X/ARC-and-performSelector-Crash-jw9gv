# Objective-C ARC and performSelector Crash
This repository demonstrates a common yet subtle bug in Objective-C related to the use of `performSelector:withObject:afterDelay:` in conjunction with Automatic Reference Counting (ARC).  The example highlights how improper handling can lead to crashes due to sending a message to a deallocated object.

## Bug Description
The bug arises when an object scheduled using `performSelector:withObject:afterDelay:` is deallocated before the specified delay expires. Attempting to invoke the selector on a deallocated object leads to a crash.

## Solution
The solution involves ensuring that the object remains in memory until the selector is executed. This typically involves techniques like strong references, blocks, or using GCD's dispatch queues.