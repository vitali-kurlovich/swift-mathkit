//
//  MKAffineTransform+Transform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 10.01.26.
//

// Transform
public extension MKAffineTransform {
    /// Apply transform to the point
    @inlinable func transform(_ point: MKPoint<Float>) -> MKPoint<Float> {
        .init(x: m11 * point.x + m21 * point.y + tx,
              y: m12 * point.x + m22 * point.y + ty)
    }

    @inlinable func transform(_ rect: MKRect<Float>) -> MKRect<Float> {
        let p0 = transform(MKPoint(x: rect.minX, y: rect.minY))
        let p1 = transform(MKPoint(x: rect.maxX, y: rect.minY))
        let p2 = transform(MKPoint(x: rect.maxX, y: rect.maxY))
        let p3 = transform(MKPoint(x: rect.minX, y: rect.maxY))

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
