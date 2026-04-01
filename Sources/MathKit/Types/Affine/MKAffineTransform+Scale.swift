//
//  Created by Vitali Kurlovich on 01.04.2026.
//

public extension MKAffineTransform {
    @inlinable mutating func scale(_ scale: Float) {
        m11 *= scale
        m12 *= scale
        m21 *= scale
        m22 *= scale
    }

    @inlinable mutating func scale(x: Float, y: Float) {
        m11 *= x
        m12 *= x
        m21 *= y
        m22 *= y
    }
}

public extension MKAffineTransform {
    @inlinable func scaledBy(x: Float, y: Float) -> Self {
        var tr = self
        tr.scale(x: x, y: y)
        return tr
    }

    @inlinable func scaled(x: Float, y: Float) -> Self {
        scaledBy(x: x, y: y)
    }

    @inlinable func scaled(_ scale: Float) -> Self {
        var tr = self
        tr.scale(scale)
        return tr
    }
}
