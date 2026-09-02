//
//  Created by Vitali Kurlovich on 30.12.25.
//

import CoreGraphics

public extension CGVector {
    @inlinable static prefix func - (_ vec: Self) -> Self {
        .init(dx: -vec.dx, dy: -vec.dy)
    }

    @inlinable static func * (vector: Self, scalar: CGFloat) -> Self {
        .init(dx: vector.dx * scalar, dy: vector.dy * scalar)
    }

    @inlinable static func * (scalar: CGFloat, vector: Self) -> Self {
        .init(dx: vector.dx * scalar, dy: vector.dy * scalar)
    }

    @inlinable static func / (left: Self, scalar: CGFloat) -> Self {
        .init(dx: left.dx / scalar, dy: left.dy / scalar)
    }
}
