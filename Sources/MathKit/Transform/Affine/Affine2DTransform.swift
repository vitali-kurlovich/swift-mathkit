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

extension Affine2DTransform: Transform, InverseTransform {
    public typealias Input = MKPoint<Float>
    public typealias Output = MKPoint<Float>

    public func transform(_ source: Input) -> Output {
        _transform.transform(source)
    }

    public func inverse(_ source: Output) -> Input {
        _transform.inverse(source)
    }
}

extension Affine2DTransform: ReverseTransform {
    public func reverse() -> some Transform {
        var tr = _transform
        tr.invert()
        return Affine2DTransform(tr)
    }
}
