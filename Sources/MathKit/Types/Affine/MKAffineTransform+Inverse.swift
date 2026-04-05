//
//  Created by Vitali Kurlovich on 05.04.2026.
//

// Inverse Transform
public extension MKAffineTransform {
    @inlinable func inverse(_ point: MKPoint<Float>) -> MKPoint<Float> {
        let det = determinant
        return .init(x: (m22 * (point.x - tx) + m21 * (ty - point.y)) / det,
                     y: (m12 * tx - m11 * ty - m12 * point.x + m11 * point.y) / det)
    }
}

// Invert
public extension MKAffineTransform {
    @inlinable var determinant: Float {
        (m11 * m22).addingProduct(-m12, m21)
    }

    @inlinable mutating func invert() {
        let det = determinant

        let tx = self.tx

        self.tx = (m21 * ty).addingProduct(-m22, tx) / det
        ty = (m12 * tx).addingProduct(-m11, ty) / det

        m12 = -m12 / det
        m21 = -m21 / det

        let m11 = self.m11

        self.m11 = m22 / det
        m22 = m11 / det
    }

    @inlinable func inverted() -> Self? {
        let det = determinant

        guard det > Float.ulpOfOne else {
            return nil
        }

        return MKAffineTransform(m11: m22 / det, m12: -m12 / det,
                                 m21: -m21 / det, m22: m11 / det,
                                 tx: (m21 * ty - m22 * tx) / det,
                                 ty: (m12 * tx - m11 * ty) / det)
    }
}

public extension MKPoint {
    @inlinable func applyingInverse(_ t: MKAffineTransform<Float>) -> Self {
        t.inverse(self)
    }
}
