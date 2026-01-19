//
//  MKPoint+Arithmetic.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 10.01.26.
//

public extension MKPoint {
    @inlinable static prefix func - (_ point: Self) -> Self {
        .init(x: -point.x, y: -point.y)
    }
}

// Scalar
public extension MKPoint {
    @inlinable static func * (point: Self, scalar: Float) -> Self {
        return .init(x: point.x * scalar, y: point.y * scalar)
    }

    @inlinable static func * (scalar: Float, point: Self) -> Self {
        point * scalar
    }

    @inlinable static func / (left: Self, scalar: Float) -> Self {
        return .init(x: left.x / scalar, y: left.y / scalar)
    }
}

public extension MKPoint {
    @inlinable static func * (left: Self, right: Self) -> Self {
        .init(x: left.x * right.x, y: left.y * right.y)
    }

    @inlinable static func *= (left: inout Self, right: Self) {
        left = left * right
    }

    @inlinable static func / (left: Self, right: Self) -> Self {
        .init(x: left.x / right.x, y: left.y / right.y)
    }

    @inlinable static func /= (left: inout Self, right: Self) {
        left = left / right
    }
}

// addingProduct
public extension MKPoint {
    func addingProduct(_ left: Self, _ right: Self) -> Self {
        .init(x: x.addingProduct(left.x, right.x), y: y.addingProduct(left.y, right.y))
    }

    mutating func addProduct(_ left: Self, _ right: Self) {
        x.addProduct(left.x, right.x)
        y.addProduct(left.y, right.y)
    }
}
