SayHi := Object clone
SayHi hello := method("Hi" println)
hiOne := SayHi clone
hiOne hello()
hiTwo := SayHi clone
hiTwo hello := method("Hey" println)
hiTwo hello()

"\nPrinting the following from a named slot:" println
hiTwo perform("hello")
