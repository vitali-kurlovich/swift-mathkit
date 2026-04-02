//
//  Created by Vitali Kurlovich on 02.04.2026.
//

extension MKVector: AdditiveArithmetic {
    @inlinable public static func + (left: Self, right: Self) -> Self {
        return .init(dx: left.dx + right.dx, dy: left.dy + right.dy)
    }

    @inlinable public static func - (left: Self, right: Self) -> Self {
        return .init(dx: left.dx - right.dx, dy: left.dy - right.dy)
    }

    @inlinable public static func += (left: inout Self, right: Self) {
        left = left + right
    }

    @inlinable public static func -= (left: inout Self, right: Self) {
        left = left - right
    }
}
