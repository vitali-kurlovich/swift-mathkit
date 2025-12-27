//
//  ToleranceCompare.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 24.12.25.
//

import struct CoreFoundation.CGFloat
import struct CoreFoundation.CGPoint
import struct CoreFoundation.CGVector

extension FloatingPoint {
    func isEqual(to other: Self, tolerance: Self) -> Bool {
        // Ensure the tolerance is non-negative
        assert(tolerance >= 0)
        return abs(self - other) <= tolerance
    }
}

extension CGPoint {
    func isEqual(to other: Self, tolerance: CGFloat) -> Bool {
        x.isEqual(to: other.x, tolerance: tolerance) &&
            y.isEqual(to: other.y, tolerance: tolerance)
    }
}

extension CGVector {
    func isEqual(to other: Self, tolerance: CGFloat) -> Bool {
        dx.isEqual(to: other.dx, tolerance: tolerance) &&
            dy.isEqual(to: other.dy, tolerance: tolerance)
    }
}
