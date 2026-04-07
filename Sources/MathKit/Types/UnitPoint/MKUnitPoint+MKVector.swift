//
//  Created by Vitali Kurlovich on 06.04.2026.
//

public extension MKVector {
    @inlinable static func * (left: Self, right: MKUnitPoint<Float>) -> Self {
        .init(dx: left.dx * right.x, dy: left.dy * right.y)
    }

    @inlinable static func *= (left: inout Self, right: MKUnitPoint<Float>) {
        left = left * right
    }
}
