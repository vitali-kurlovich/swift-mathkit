//
//  Affine2DTransform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 28.12.25.
//

import Foundation

public struct Affine2DTransform<Float: FloatingPoint & Sendable>: Hashable, Sendable {
    var _transform: MKAffineTransform<Float>

    public init(_ transform: MKAffineTransform<Float>) {
        _transform = transform
    }
}

public extension Affine2DTransform {
    @inlinable static var identity: Self {
        .init()
    }
}

public extension Affine2DTransform {
    @inlinable init() {
        self.init(.identity)
    }

    @inlinable init(m11: Float, m12: Float, m21: Float, m22: Float, tx: Float, ty: Float) {
        self.init(.init(m11: m11, m12: m12, m21: m21, m22: m22, tx: tx, ty: ty))
    }
}
