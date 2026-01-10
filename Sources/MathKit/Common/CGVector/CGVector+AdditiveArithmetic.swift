//
//  CGVector+AdditiveArithmetic.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 30.12.25.
//

import Foundation

#if canImport(CoreGraphics)
    import CoreGraphics
#else
    extension CGVector: Equatable {}
#endif

extension CGVector: @retroactive AdditiveArithmetic {
    @inlinable public static func + (left: Self, right: Self) -> Self {
        return .init(dx: left.dx + right.dx, dy: left.dy + right.dy)
    }

    @inlinable public static func - (left: Self, right: Self) -> Self {
        return .init(dx: left.dx - right.dx, dy: left.dy - right.dy)
    }

    @inlinable public static func += (left: inout Self, right: Self) {
        left = left + right
    }

    @inlinable public static func -= (left: inout Self, right: Self) {
        left = left - right
    }
}
