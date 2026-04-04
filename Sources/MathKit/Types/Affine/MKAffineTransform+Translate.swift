//
//  Created by Vitali Kurlovich on 01.04.2026.
//

public extension MKAffineTransform {
    /**
     Creates an affine transformation matrix from translation values.
     The matrix takes the following form:

     [ 1  0  0 ]
     [ 0  1  0 ]
     [ x  y  1 ]
     */

    @inlinable init(translationX tx: Float, y ty: Float) {
        self.init(m11: 1, m12: 0,
                  m21: 0, m22: 1,
                  tx: tx, ty: ty)
    }

    @inlinable init(translationByX x: Float, byY y: Float) {
        self.init(translationX: x, y: y)
    }

    @inlinable init(_ origin: MKPoint<Float>) {
        self.init(translationByX: origin.x, byY: origin.y)
    }

    @inlinable init(_ vector: MKVector<Float>) {
        self.init(translationByX: vector.dx, byY: vector.dy)
    }
}

public extension MKAffineTransform {
    @inlinable static func translation(x: Float, y: Float) -> Self {
        .init(translationByX: x, byY: y)
    }

    @inlinable static func translation(_ origin: MKPoint<Float>) -> Self {
        .init(origin)
    }

    @inlinable static func translation(_ vector: MKVector<Float>) -> Self {
        .init(vector)
    }
}

public extension MKAffineTransform {
    @inlinable mutating func translate(x: Float, y: Float) {
        tx += (m11 * x).addingProduct(m21, y)
        ty += (m12 * x).addingProduct(m22, y)
    }

    @inlinable mutating func translate(_ origin: MKPoint<Float>) {
        translate(x: origin.x, y: origin.y)
    }

    @inlinable mutating func translate(_ vector: MKVector<Float>) {
        translate(x: vector.dx, y: vector.dy)
    }
}

public extension MKAffineTransform {
    @inlinable func translatedBy(x: Float, y: Float) -> Self {
        var tr = self
        tr.translate(x: x, y: y)
        return tr
    }

    @inlinable func translated(x: Float, y: Float) -> Self {
        translatedBy(x: x, y: y)
    }

    @inlinable func translated(_ origin: MKPoint<Float>) -> Self {
        translated(x: origin.x, y: origin.y)
    }

    @inlinable func translated(_ vector: MKVector<Float>) -> Self {
        translated(x: vector.dx, y: vector.dy)
    }
}
