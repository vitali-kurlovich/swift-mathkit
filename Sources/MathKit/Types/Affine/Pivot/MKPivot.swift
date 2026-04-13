//
//  Created by Vitali Kurlovich on 13.04.2026.
//

import Foundation

public struct MKPivot<Float: FloatingPoint & Sendable>: Hashable, Sendable {
    public let center: MKPoint<Float>
    public let x: MKVector<Float>
    public let y: MKVector<Float>

    public init(center: MKPoint<Float>, x: MKVector<Float>, y: MKVector<Float>) {
        self.center = center
        self.x = x
        self.y = y
    }
}

public extension MKPivot {
    static var zero: Self {
        .init(center: .zero, x: MKVector<Float>(dx: 1, dy: 0), y: MKVector<Float>(dx: 0, dy: 1))
    }
}

public extension MKPivot {
    @inlinable
    static func * (left: Self, scale: Float) -> Self {
        return .init(center: left.center, x: left.x * scale, y: left.y * scale)
    }

    @inlinable
    func scaled(_ scale: Float) -> Self {
        self * scale
    }
}

public extension MKPivot {
    @inlinable
    func normalized() -> Self {
        .init(center: center, x: x.normalized(), y: y.normalized())
    }
}

public extension MKAffineTransform {
    var pivot: MKPivot<Float> {
        let center = MKPoint<Float>.zero.applying(self)

        let x = MKVector<Float>(dx: 1, dy: 0).applying(self)
        let y = MKVector<Float>(dx: 0, dy: 1).applying(self)

        return MKPivot<Float>(center: center, x: x, y: y)
    }

    init(_ pivot: MKPivot<Float>) {
        // center.x = tx + m11 * 0 + m21 * 0
        // center.y = ty + m12 * 0 + m22 * 0
        let center = pivot.center

        // (dx: 1, dy: 0)
        //  dx = m11 * 1 + m21 * 0
        //  dy = m12 * 1 + m22 * 0
        //
        let px = pivot.x

        // (dx: 0, dy: 1)
        //  dx = m11 * 0 + m21 * 1
        //  dy = m12 * 0 + m22 * 1
        //
        let py = pivot.y

        self.init(m11: px.dx, m12: px.dy,
                  m21: py.dx, m22: py.dy,
                  tx: pivot.center.x, ty: center.y)
    }
}
