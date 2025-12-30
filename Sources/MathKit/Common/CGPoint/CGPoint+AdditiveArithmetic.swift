//
//  CGPoint+AdditiveArithmetic.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 30.12.25.
//

import Foundation

#if canImport(CoreGraphics)
    import CoreGraphics
#endif

extension CGPoint: @retroactive AdditiveArithmetic {
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
