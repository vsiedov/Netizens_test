import Foundation

func strongify<Context1: AnyObject, Argument1, Result>(weak context1: Context1?, closure: @escaping(Context1, Argument1) -> Result?) -> (Argument1) -> Result? {
    return { [weak context1] argument1 in
        guard let strongContext1 = context1 else { return nil }
        return closure(strongContext1, argument1)
    }
}

func strongify<Context1: AnyObject, Argument1, Argument2, Result>(weak context1: Context1?, closure: @escaping(Context1, Argument1, Argument2) -> Result?) -> (Argument1, Argument2) -> Result? {
    return { [weak context1] argument1, argument2 in
        guard let strongContext1 = context1 else { return nil }
        return closure(strongContext1, argument1, argument2)
    }
}

func strongify<Context1: AnyObject, Argument1, Argument2, Argument3, Result>(weak context1: Context1?, closure: @escaping(Context1, Argument1, Argument2, Argument3) -> Result?) -> (Argument1, Argument2, Argument3) -> Result? {
    return { [weak context1] argument1, argument2, argument3 in
        guard let strongContext1 = context1 else { return nil }
        return closure(strongContext1, argument1, argument2, argument3)
    }
}
