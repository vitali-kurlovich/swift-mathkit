//
//  MKPoint+MKSize.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 10.01.26.
//

public extension MKPoint {
    @inlinable static func + (point: Self, size: MKSize<Float>) -> Self {
        .init(x: point.x + size.width, y: point.y + size.height)
    }

    @inlinable static func - (point: Self, size: MKSize<Float>) -> Self {
        .init(x: point.x - size.width, y: point.y - size.height)
    }
}

public extension MKPoint {
    @inlinable static func += (point: inout Self, size: MKSize<Float>) {
        point = point + size
    }

    @inlinable static func -= (point: inout Self, size: MKSize<Float>) {
        point = point - size
    }
}
