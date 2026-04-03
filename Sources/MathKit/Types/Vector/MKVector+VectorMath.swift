//
//  Created by Vitali Kurlovich on 03.04.2026.
//

@inlinable public func dot<Float: FloatingPoint & Sendable>(_ left: MKVector<Float>, _ right: MKVector<Float>) -> Float {
    (left.dx * right.dx).addingProduct(left.dy, right.dy)
}

@inlinable public func cross<Float: FloatingPoint & Sendable>(_ first: MKVector<Float>, _ second: MKVector<Float>) -> Float {
    (first.dx * second.dy).addingProduct(-first.dy, second.dx)
}

public extension MKVector {
    @inlinable func dot(_ other: Self) -> Float {
        MathKit.dot(self, other)
    }

    @inlinable func cross(_ other: Self) -> Float {
        MathKit.cross(self, other)
    }
}
