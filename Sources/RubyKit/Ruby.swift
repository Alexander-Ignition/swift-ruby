import CRuby

public let Ruby = RubyInterface.shared

public struct RubyInterface {
    fileprivate static let shared = RubyInterface()

    private init() {
        ruby_setup()
        ruby_init_loadpath()
    }

    public func showVersion() {
        ruby_show_version()
    }

    public func require(_ path: String) {
        rb_require(path)
    }

    public func eval(_ script: String) -> RubyObject {
        var status: Int32 = 0
        let value = rb_eval_string_protect(script, &status)
        // TODO: throw Error if status != 0
        return RubyObject(value: value)
    }

    public func p(_ object: RubyObject) {
        rb_p(object.value)
    }

    public func puts(_ object: RubyObject) {
        var args = object.value
        rb_funcallv(0, rb_intern("puts"), 1, &args)
    }
}
