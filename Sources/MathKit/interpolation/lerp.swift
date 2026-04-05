//
//  Created by Vitali Kurlovich on 24.12.25.
//

import Foundation

@inlinable public func lerp<R: FloatingPoint>(_ v0: R, _ v1: R, t: R) -> R {
    v0 + t * (v1 - v0)
}

@inlinable
public func lerp(_ v0: CGPoint, _ v1: CGPoint, t: CGFloat) -> CGPoint {
    .init(x: lerp(v0.x, v1.x, t: t),
          y: lerp(v0.y, v1.y, t: t))
}

@inlinable
public func lerp<Float: FloatingPoint & Sendable>(_ v0: MKPoint<Float>, _ v1: MKPoint<Float>, t: Float) -> MKPoint<Float> {
    .init(x: lerp(v0.x, v1.x, t: t),
          y: lerp(v0.y, v1.y, t: t))
}

@inlinable
public func lerp<Float: FloatingPoint & Sendable>(_ v0: MKVector<Float>,
                                                  _ v1: MKVector<Float>, t: Float) -> MKVector<Float>
{
    .init(dx: lerp(v0.dx, v1.dx, t: t),
          dy: lerp(v0.dy, v1.dy, t: t))
}

@inlinable
public func lerp<Float: FloatingPoint & Sendable>(_ v0: MKSize<Float>,
                                                  _ v1: MKSize<Float>, t: Float) -> MKSize<Float>
{
    .init(width: lerp(v0.width, v1.width, t: t),
          height: lerp(v0.height, v1.height, t: t))
}

@inlinable
public func lerp<Float: FloatingPoint & Sendable>(_ v0: MKAngle<Float>,
                                                  _ v1: MKAngle<Float>, t: Float) -> MKAngle<Float>
{
    .init(radians: lerp(v0.radians, v1.radians, t: t))
}

@inlinable
public func lerp<Float: FloatingPoint & Sendable>(_ v0: MKRect<Float>,
                                                  _ v1: MKRect<Float>, t: Float) -> MKRect<Float>
{
    .init(origin: lerp(v0.origin, v1.origin, t: t),
          size: lerp(v0.size, v1.size, t: t))
}

@inlinable
public func lerp<Float: FloatingPoint & Sendable>(_ v0: MKAffineTransformComponents<Float>,
                                                  _ v1: MKAffineTransformComponents<Float>, t: Float) -> MKAffineTransformComponents<Float>
{
    .init(
        translation: lerp(v0.translation, v1.translation, t: t),
        rotation: lerp(v0.rotation, v1.rotation, t: t),
        scale: lerp(v0.scale, v1.scale, t: t)
    )
}

#if canImport(CoreGraphics)
    import CoreGraphics

    @inlinable public func lerp(_ v0: CGVector, _ v1: CGVector, t: CGFloat) -> CGVector {
        CGVector(dx: lerp(v0.dx, v1.dx, t: t), dy: lerp(v0.dy, v1.dy, t: t))
    }

#endif // canImport(CoreGraphics)
