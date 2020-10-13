import CRuby

public enum Ruby {

    public static func setup() {
        ruby_setup()
    }

    public static func loadPath() {
        ruby_init_loadpath()
    }

//    public static func protect(_ function: (RubyObject) -> RubyObject) {
//        var state: Int32 = 0
//        rb_protect({ value in value }, 0, &state)
//    }

    public static func showVersion() {
        ruby_show_version()
    }

    public static func require(_ path: String) {
        rb_require(path)
    }

    public static func eval(_ script: String) -> RubyObject {
        var status: Int32 = 0
        let value = rb_eval_string_protect(script, &status)
        // TODO: throw Error if status != 0
        return RubyObject(value: value)
    }

    public static func p(_ object: RubyObject) {
        rb_p(object.value)
    }

    public static func puts(_ object: RubyObject) {
        var args = object.value
        rb_funcallv(0, rb_intern("puts"), 1, &args)
    }
}
