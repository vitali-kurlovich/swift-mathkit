//
//  Created by Vitali Kurlovich on 10.01.26.
//

// Transform
public extension MKAffineTransform {
    /// Apply transform to the point
    @inlinable func transform(_ point: MKPoint<Float>) -> MKPoint<Float> {
        .init(x: tx.addingProduct(m11, point.x).addingProduct(m21, point.y),
              y: ty.addingProduct(m12, point.x).addingProduct(m22, point.y))
    }

    @inlinable func transform(_ rect: MKRect<Float>) -> MKRect<Float> {
        let p0 = transform(MKPoint(x: rect.minX, y: rect.minY))
        let p1 = transform(MKPoint(x: rect.maxX, y: rect.minY))
        let p2 = transform(MKPoint(x: rect.maxX, y: rect.maxY))
        let p3 = transform(MKPoint(x: rect.minX, y: rect.maxY))

        return .bounds(p0, p1, p2, p3)
    }

    @inlinable func transform(_ size: MKSize<Float>) -> MKSize<Float> {
        let p0 = MKPoint(x: tx, y: ty)
        let p1 = MKPoint(x: tx.addingProduct(m11, size.width), y: ty.addingProduct(m12, size.width))
        let p2 = transform(MKPoint(x: size.width, y: size.height))
        let p3 = MKPoint(x: tx.addingProduct(m21, size.height), y: ty.addingProduct(m22, size.height))

        return .bounds(p0, p1, p2, p3)
    }
}

// Inverse Transform
public extension MKAffineTransform {
    @inlinable func inverse(_ point: MKPoint<Float>) -> MKPoint<Float> {
        let det = determinant
        return .init(x: (m22 * (point.x - tx) + m21 * (ty - point.y)) / det,
                     y: (m12 * tx - m11 * ty - m12 * point.x + m11 * point.y) / det)
    }
}

public extension MKPoint {
    @inlinable func applying(_ t: MKAffineTransform<Float>) -> Self {
        t.transform(self)
    }
}

public extension MKSize {
    @inlinable func applying(_ t: MKAffineTransform<Float>) -> Self {
        t.transform(self)
    }
}

public extension MKRect {
    @inlinable func applying(_ t: MKAffineTransform<Float>) -> Self {
        t.transform(self)
    }
}

extension MKSize {
    @inlinable static func bounds(_ p0: MKPoint<Float>, _ p1: MKPoint<Float>, _ p2: MKPoint<Float>, _ p3: MKPoint<Float>) -> Self {
        let minX = min(p0.x, p1.x, p2.x, p3.x)
        let maxX = max(p0.x, p1.x, p2.x, p3.x)

        let minY = min(p0.y, p1.y, p2.y, p3.y)
        let maxY = max(p0.y, p1.y, p2.y, p3.y)

        return .init(width: maxX - minX, height: maxY - minY)
    }
}
