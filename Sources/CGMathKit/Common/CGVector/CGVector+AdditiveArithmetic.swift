//
//  Created by Vitali Kurlovich on 30.12.25.
//

import CoreGraphics

extension CGVector: @retroactive AdditiveArithmetic {
    @inlinable public static func + (left: Self, right: Self) -> Self {
        .init(dx: left.dx + right.dx, dy: left.dy + right.dy)
    }

    @inlinable public static func - (left: Self, right: Self) -> Self {
        .init(dx: left.dx - right.dx, dy: left.dy - right.dy)
    }

    @inlinable public static func += (left: inout Self, right: Self) {
        left = left + right
    }

    @inlinable public static func -= (left: inout Self, right: Self) {
        left = left - right
    }
}
