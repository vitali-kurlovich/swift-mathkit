//
//  Created by Vitali Kurlovich on 01.04.2026.
//

public extension MKAffineTransform {
    /**
     Creates an affine transformation matrix from scaling values.
     The matrix takes the following form:

     [ x  0  0 ]
     [ 0  y  0 ]
     [ 0  0  1 ]
     */
    @inlinable init(scaleByX x: Float, byY y: Float) {
        self.init(m11: x, m12: 0,
                  m21: 0, m22: y,
                  tx: 0, ty: 0)
    }

    /**
     Creates an affine transformation matrix from scaling a single value.
     The matrix takes the following form:

     [ f  0  0 ]
     [ 0  f  0 ]
     [ 0  0  1 ]
     */
    @inlinable init(scale factor: Float) {
        self.init(scaleByX: factor, byY: factor)
    }

    @inlinable static func scale(_ scale: Float) -> Self {
        .init(scale: scale)
    }

    @inlinable static func scale(x: Float, y: Float) -> Self {
        .init(scaleByX: x, byY: y)
    }

    @inlinable static func scale(_ size: MKSize<Float>) -> Self {
        .scale(x: size.width, y: size.height)
    }
}

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

    @inlinable mutating func scale(_ size: MKSize<Float>) {
        scale(x: size.width, y: size.height)
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

    @inlinable func scaled(_ size: MKSize<Float>) -> Self {
        var tr = self
        tr.scale(size)
        return tr
    }
}
