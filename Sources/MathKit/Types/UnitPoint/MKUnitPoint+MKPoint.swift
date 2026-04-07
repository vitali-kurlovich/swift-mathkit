//
//  Created by Vitali Kurlovich on 06.04.2026.
//

public extension MKPoint {
    @inlinable static func * (left: Self, right: MKUnitPoint<Float>) -> Self {
        .init(x: left.x * right.x, y: left.y * right.y)
    }

    @inlinable static func *= (left: inout Self, right: MKUnitPoint<Float>) {
        left = left * right
    }
}
