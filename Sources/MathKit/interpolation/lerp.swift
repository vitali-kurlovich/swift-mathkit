//
//  lerp.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 24.12.25.
//

import Foundation

#if canImport(CoreGraphics)
    import CoreGraphics

    public func lerp(_ v0: CGVector, _ v1: CGVector, t: CGFloat) -> CGVector {
        CGVector(dx: lerp(v0.dx, v1.dx, t: t), dy: lerp(v0.dy, v1.dy, t: t))
    }

#endif // canImport(CoreGraphics)

public func lerp<R: FloatingPoint>(_ v0: R, _ v1: R, t: R) -> R {
    v0 + t * (v1 - v0)
}

public func lerp(_ v0: CGPoint, _ v1: CGPoint, t: CGFloat) -> CGPoint {
    CGPoint(x: lerp(v0.x, v1.x, t: t), y: lerp(v0.y, v1.y, t: t))
}

@inlinable public func lerp<Float: FloatingPoint & Sendable>(_ v0: MKPoint<Float>, _ v1: MKPoint<Float>, t: Float) -> MKPoint<Float> {
    .init(x: lerp(v0.x, v1.x, t: t), y: lerp(v0.y, v1.y, t: t))
}

@inlinable public func lerp<Float: FloatingPoint & Sendable>(_ v0: MKVector<Float>,
                                                             _ v1: MKVector<Float>, t: Float) -> MKVector<Float>
{
    .init(dx: lerp(v0.dx, v1.dx, t: t), dy: lerp(v0.dy, v1.dy, t: t))
}
