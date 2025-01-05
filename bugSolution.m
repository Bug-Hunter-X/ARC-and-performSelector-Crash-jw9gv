To fix this, several approaches can be used:

1. **Strong Reference:** Maintain a strong reference to the object in a property of another object that has a longer lifespan. This guarantees the object won't be deallocated prematurely.

2. **Blocks:** Instead of `performSelector`, use blocks for delayed execution. Blocks capture a copy of the object, effectively preventing premature deallocation.

3. **GCD Dispatch Queues:** Leverage GCD's dispatch queues and their associated blocks to schedule execution safely.  GCD manages the object's lifecycle more effectively.

Here's an example using blocks for a more robust approach:

```objectivec
@implementation MyClass

- (void)myMethod {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ 
        // Access and use self here; it's guaranteed to be valid
        if (self) {
          [self doSomething];
        }
    });
}

- (void)doSomething {
    // Your code
}

@end
```
This revised approach avoids the pitfalls of `performSelector:withObject:afterDelay:` and provides a more reliable way to perform delayed operations.