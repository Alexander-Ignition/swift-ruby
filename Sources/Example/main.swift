import Foundation
import RubyKit

Ruby.showVersion()

do {
    let hello: RubyObject = "Hello!"
    Ruby.p(hello)
    Ruby.puts(hello)

    let array: RubyObject = ["1", "2"]
    Ruby.p(array)
    Ruby.puts(array)

    print("count:")
    Ruby.puts(array.count())

    print("class:", array.className, hello.className)
    print("respond:", array.respond(to: "to_s"))
    print("to_s:", array.to_s())
    print("to_sym:", hello.to_sym())
}
