//
//  MKSize.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 10.01.26.
//

public nonisolated struct MKSize<Float: FloatingPoint & Sendable>: Hashable, Sendable {
    public var width: Float
    public var height: Float

    @inlinable public init(width: Float, height: Float) {
        assert(width >= 0)
        assert(height >= 0)
        self.width = width
        self.height = height
    }
}

public extension MKSize {
    @inlinable init() {
        self.init(width: 0, height: 0)
    }

    @inlinable static var zero: Self {
        .init()
    }
}

public extension MKSize {
    @inlinable static func * (size: Self, scalar: Float) -> Self {
        return .init(width: size.width * scalar, height: size.height * scalar)
    }

    @inlinable static func * (scalar: Float, size: Self) -> Self {
        return .init(width: size.width * scalar, height: size.height * scalar)
    }

    @inlinable static func / (size: Self, scalar: Float) -> Self {
        return .init(width: size.width / scalar, height: size.height / scalar)
    }
}
