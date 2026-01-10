//
//  MKVector+Arithmetic.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 10.01.26.
//

public extension MKVector {
    @inlinable static prefix func - (_ vector: Self) -> Self {
        .init(dx: -vector.dx, dy: -vector.dy)
    }

    @inlinable static func * (vector: Self, scalar: Float) -> Self {
        return .init(dx: vector.dx * scalar, dy: vector.dy * scalar)
    }

    @inlinable static func * (scalar: Float, vector: Self) -> Self {
        vector * scalar
    }

    @inlinable static func / (vector: Self, scalar: Float) -> Self {
        return .init(dx: vector.dx / scalar, dy: vector.dy / scalar)
    }
}
