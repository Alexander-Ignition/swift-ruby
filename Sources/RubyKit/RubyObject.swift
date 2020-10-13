import CRuby

@dynamicMemberLookup
public struct RubyObject {
    let value: CRuby.VALUE

    public var className: String {
        String(cString: rb_obj_classname(value))
    }

    public var isNil: Bool {
        rb_type(value) == RUBY_T_NIL.rawValue
    }

    public subscript(dynamicMember member: String) -> RubyFunction {
        RubyFunction(receiver: self, name: member)
    }

    public func respond(to method: String) -> Bool {
        rb_respond_to(value, rb_intern(method)) != 0
    }
}

//extension RubyObject: CustomStringConvertible {
//    public var description: String {
//        var ptr = _value
//        return String(cString: rb_string_value_ptr(&ptr))
//    }
//}

// MARK: - String

extension RubyObject: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(value: rb_str_new(value, value.count))
    }
}

// MARK: - Array

extension RubyObject: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: RubyObject...) {
        self.init(objects: elements)
    }

    public init(objects: [RubyObject]) {
        value = rb_ary_new()
        objects.forEach { rb_ary_push(value, $0.value) }
    }
}
