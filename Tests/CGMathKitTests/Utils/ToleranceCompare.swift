//
//  Created by Kurlovich Vitali on 9/1/26.
//

import CGMathKit
import Foundation
import MathKitUtils

public extension FloatingPoint {
    func isEqual(to other: Self, tolerance: Self) -> Bool {
        // Ensure the tolerance is non-negative
        assert(tolerance >= 0)
        return self == other || abs(self - other) <= tolerance
    }
}

public extension CGPoint {
    func isEqual(to other: Self, tolerance: CGFloat) -> Bool {
        x.isEqual(to: other.x, tolerance: tolerance) &&
            y.isEqual(to: other.y, tolerance: tolerance)
    }
}

public extension CGSize {
    func isEqual(to other: Self, tolerance: CGFloat) -> Bool {
        width.isEqual(to: other.width, tolerance: tolerance) &&
            height.isEqual(to: other.height, tolerance: tolerance)
    }
}

public extension CGRect {
    func isEqual(to other: Self, tolerance: CGFloat) -> Bool {
        origin.isEqual(to: other.origin, tolerance: tolerance) &&
            size.isEqual(to: other.size, tolerance: tolerance)
    }
}

public extension CGVector {
    func isEqual(to other: Self, tolerance: CGFloat) -> Bool {
        dx.isEqual(to: other.dx, tolerance: tolerance) &&
            dy.isEqual(to: other.dy, tolerance: tolerance)
    }
}
