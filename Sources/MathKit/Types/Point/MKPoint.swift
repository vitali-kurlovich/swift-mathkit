//
//  MKPoint.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 10.01.26.
//

public nonisolated struct MKPoint<Float: FloatingPoint & Sendable>: Hashable, Sendable {
    public var x: Float
    public var y: Float

    @inlinable public init(x: Float, y: Float) {
        self.x = x
        self.y = y
    }
}

public extension MKPoint {
    @inlinable init() {
        self.init(x: 0, y: 0)
    }

    @inlinable static var zero: Self {
        .init()
    }
}

extension MKPoint: AdditiveArithmetic {
    @inlinable public static func + (left: Self, right: Self) -> Self {
        return .init(x: left.x + right.x, y: left.y + right.y)
    }

    @inlinable public static func - (left: Self, right: Self) -> Self {
        return .init(x: left.x - right.x, y: left.y - right.y)
    }

    @inlinable public static func += (left: inout Self, right: Self) {
        left = left + right
    }

    @inlinable public static func -= (left: inout Self, right: Self) {
        left = left - right
    }
}
