//
//  Affine2DTransform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 28.12.25.
//

import Foundation

public struct Affine2DTransform: Hashable, Sendable {
    var _transform: MKAffineTransform<CGFloat>

    public init(_ transform: MKAffineTransform<CGFloat>) {
        _transform = transform
    }
}

public extension Affine2DTransform {
    @inlinable static var identity: Self {
        .init(MKAffineTransform<CGFloat>.identity)
    }
}

public extension Affine2DTransform {
    @inlinable init() {
        self.init(MKAffineTransform<CGFloat>.identity)
    }

    @inlinable init(m11: CGFloat, m12: CGFloat, m21: CGFloat, m22: CGFloat, tx: CGFloat = 0, ty: CGFloat = 0) {
        self.init(.init(m11: m11, m12: m12, m21: m21, m22: m22, tx: tx, ty: ty))
    }
}
