//
//  RectTransform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 27.12.25.
//

public nonisolated struct RectTransform<Float: FloatingPoint & Sendable>: Hashable & Sendable {
    public var rect: MKRect<Float>

    @inlinable public init(_ rect: MKRect<Float>) {
        assert(rect.size != .zero)
        self.rect = rect
    }
}

extension RectTransform: Transform, InverseTransform {
    @inlinable public func transform(_ source: MKPoint<Float>) -> MKPoint<Float> {
        let x = rect.origin.x.addingProduct(source.x, rect.size.width)
        let y = rect.origin.y.addingProduct(source.y, rect.size.height)
        return .init(x: x, y: y)
    }

    @inlinable public func inverse(_ source: MKPoint<Float>) -> MKPoint<Float> {
        let x = (source.x - rect.origin.x) / rect.width
        let y = (source.y - rect.origin.y) / rect.height
        return .init(x: x, y: y)
    }
}
