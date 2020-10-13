import CRuby

@dynamicCallable
public struct RubyFunction {
    let receiver: RubyObject
    let name: String

    public func dynamicallyCall(withArguments args: [RubyObject]) -> RubyObject {
        let value = args.map(\.value).withUnsafeBufferPointer { argv in
            rb_funcallv_public(receiver.value, rb_intern(name), Int32(args.count), argv.baseAddress)
        }
        return RubyObject(value: value)
    }

    public func dynamicallyCall(withKeywordArguments args: KeyValuePairs<String, RubyObject>) -> RubyObject {
        fatalError("TODO")
    }
}
