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
