//
//  Created by Vitali Kurlovich on 01.04.2026.
//

public extension MKAffineTransform {
    @inlinable mutating func translate(x: Float, y: Float) {
        tx += (m11 * x).addingProduct(m21, y)
        ty += (m12 * x).addingProduct(m22, y)
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
}
