//
//  CGPoint+Arithmetic.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 30.12.25.
//

import Foundation

public extension CGPoint {
    @inlinable static prefix func - (_ point: Self) -> Self {
        .init(x: -point.x, y: -point.y)
    }

    @inlinable static func * (point: Self, scalar: CGFloat) -> Self {
        return .init(x: point.x * scalar, y: point.y * scalar)
    }

    @inlinable static func * (scalar: CGFloat, point: Self) -> Self {
        return .init(x: point.x * scalar, y: point.y * scalar)
    }

    @inlinable static func / (left: Self, scalar: CGFloat) -> Self {
        return .init(x: left.x / scalar, y: left.y / scalar)
    }
}
