//
//  Created by Vitali Kurlovich on 06.04.2026.
//

extension MKUnitPoint: AdditiveArithmetic {
    @inlinable public static func + (left: Self, right: Self) -> Self {
        .init(x: left.x + right.x, y: left.y + right.y)
    }

    @inlinable public static func - (left: Self, right: Self) -> Self {
        .init(x: left.x - right.x, y: left.y - right.y)
    }

    @inlinable public static func += (left: inout Self, right: Self) {
        left = left + right
    }

    @inlinable public static func -= (left: inout Self, right: Self) {
        left = left - right
    }
}
