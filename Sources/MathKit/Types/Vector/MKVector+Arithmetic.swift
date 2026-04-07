//
//  Created by Vitali Kurlovich on 10.01.26.
//

public extension MKVector {
    @inlinable static prefix func - (_ vector: Self) -> Self {
        .init(dx: -vector.dx, dy: -vector.dy)
    }

    @inlinable mutating func negate() {
        dx.negate()
        dy.negate()
    }
}

public extension MKVector {
    @inlinable static func * (vector: Self, scalar: Float) -> Self {
        return .init(dx: vector.dx * scalar, dy: vector.dy * scalar)
    }

    @inlinable static func * (scalar: Float, vector: Self) -> Self {
        vector * scalar
    }

    @inlinable static func *= (left: inout Self, scalar: Float) {
        left = left * scalar
    }

    @inlinable static func * (left: Self, right: Self) -> Self {
        return .init(dx: left.dx * right.dx, dy: left.dy * right.dy)
    }

    @inlinable static func *= (left: inout Self, right: Self) {
        left = left * right
    }
}

public extension MKVector {
    @inlinable static func / (vector: Self, scalar: Float) -> Self {
        return .init(dx: vector.dx / scalar, dy: vector.dy / scalar)
    }

    @inlinable static func / (scalar: Float, vector: Self) -> Self {
        return .init(dx: scalar / vector.dx, dy: scalar / vector.dy)
    }

    @inlinable static func /= (left: inout Self, scalar: Float) {
        left = left / scalar
    }

    @inlinable static func / (left: Self, right: Self) -> Self {
        return .init(dx: left.dx / right.dx, dy: left.dy / right.dy)
    }

    @inlinable static func /= (left: inout Self, right: Self) {
        left = left / right
    }
}

public extension MKVector {
    @inlinable func addingProduct(_ left: Self, _ right: Self) -> Self {
        .init(dx: dx.addingProduct(left.dx, right.dx), dy: dy.addingProduct(left.dy, right.dy))
    }

    @inlinable mutating func addProduct(_ left: Self, _ right: Self) {
        dx.addProduct(left.dx, right.dx)
        dy.addProduct(left.dy, right.dy)
    }
}
