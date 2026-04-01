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
    @inlinable init(translationByX x: Float, byY y: Float) {
        self.init(m11: 1, m12: 0,
                  m21: 0, m22: 1,
                  tx: x, ty: y)
    }

    @inlinable static func translation(x: Float, y: Float) -> Self {
        .init(translationByX: x, byY: y)
    }

    @inlinable static func translation(_ vector: MKVector<Float>) -> Self {
        .translation(x: vector.dx, y: vector.dy)
    }
}

public extension MKAffineTransform {
    @inlinable mutating func translate(x: Float, y: Float) {
        tx += (m11 * x).addingProduct(m21, y)
        ty += (m12 * x).addingProduct(m22, y)
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

    @inlinable func translated(_ vector: MKVector<Float>) -> Self {
        translated(x: vector.dx, y: vector.dy)
    }
}
