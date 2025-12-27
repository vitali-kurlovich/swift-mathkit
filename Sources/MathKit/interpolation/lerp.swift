//
//  lerp.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 24.12.25.
//

import struct CoreFoundation.CGFloat
import struct CoreFoundation.CGPoint
import struct CoreFoundation.CGVector

public func lerp<R: FloatingPoint>(_ v0: R, _ v1: R, t: R) -> R {
    v0 + t * (v1 - v0)
}

public func lerp(_ v0: CGPoint, _ v1: CGPoint, t: CGFloat) -> CGPoint {
    CGPoint(x: lerp(v0.x, v1.x, t: t), y: lerp(v0.y, v1.y, t: t))
}

public func lerp(_ v0: CGVector, _ v1: CGVector, t: CGFloat) -> CGVector {
    CGVector(dx: lerp(v0.dx, v1.dx, t: t), dy: lerp(v0.dy, v1.dy, t: t))
}

public func lerp(_ v0: UnitPoint, _ v1: UnitPoint, t: CGFloat) -> UnitPoint {
    UnitPoint(x: lerp(v0.x, v1.x, t: t), y: lerp(v0.y, v1.y, t: t))
}
