//
//  Created by Vitali Kurlovich on 06.04.2026.
//

public extension MKSize {
    @inlinable static func * (left: Self, right: MKUnitPoint<Float>) -> Self {
        .init(width: left.width * right.x, height: left.height * right.y)
    }

    @inlinable static func *= (left: inout Self, right: MKUnitPoint<Float>) {
        left = left * right
    }
}

public extension MKSize {
    @inlinable func projected(_ unit: MKUnitPoint<Float>) -> MKVector<Float> {
        .init(dx: width * unit.x, dy: height * unit.y)
    }
}
