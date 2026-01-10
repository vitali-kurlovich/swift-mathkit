//
//  CGPoint+CGSize.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 10.01.26.
//
import Foundation

public extension CGPoint {
    @inlinable static func + (point: Self, size: CGSize) -> Self {
        .init(x: point.x + size.width, y: point.y + size.height)
    }

    @inlinable static func - (point: Self, size: CGSize) -> Self {
        .init(x: point.x - size.width, y: point.y - size.height)
    }
}

public extension CGPoint {
    @inlinable static func += (point: inout Self, size: CGSize) {
        point = point + size
    }

    @inlinable static func -= (point: inout Self, size: CGSize) {
        point = point - size
    }
}
