import Foundation
import RubyKit

Ruby.setup()
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
//do {
//    var string = rb_str_new_cstr("Hello world")
//    let result = rb_funcallv(string, rb_intern("to_s"), 1, RUBY_Qnil)
//    rb_p(result)
//}

//rb_require("1")
