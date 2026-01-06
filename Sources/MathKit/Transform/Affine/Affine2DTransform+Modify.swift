//
//  Affine2DTransform+Modify.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 29.12.25.
//

import Foundation

// Rotation
public extension Affine2DTransform {
    init(rotation: Angle) {
        let transform = MKAffineTransform(rotationByRadians: rotation.radians)
        self.init(transform)
    }

    mutating func rotate(_ angle: Angle) {
        _transform.rotate(byRadians: angle.radians)
    }
}

// Scale
public extension Affine2DTransform {
    @inlinable init(scale: CGFloat) {
        self.init(.init(scale: scale))
    }

    @inlinable init(scaleByX x: CGFloat, byY y: CGFloat) {
        self.init(.init(scaleByX: x, byY: y))
    }

    mutating func scale(_ scale: CGFloat) {
        _transform.scale(scale)
    }

    mutating func scale(x: CGFloat, y: CGFloat) {
        _transform.scale(x: x, y: y)
    }
}

// Translate
public extension Affine2DTransform {
    @inlinable init(translationByX x: CGFloat, byY y: CGFloat) {
        self.init(.init(translationByX: x, byY: y))
    }

    mutating func translate(x: CGFloat, y: CGFloat) {
        _transform.translate(x: x, y: y)
    }
}

public extension Affine2DTransform {
    mutating func append(_ transform: Self) {
        _transform.append(transform._transform)
    }

    mutating func append(_ transform: MKAffineTransform<CGFloat>) {
        _transform.append(transform)
    }

    mutating func prepend(_ transform: Self) {
        _transform.prepend(transform._transform)
    }

    mutating func prepend(_ transform: MKAffineTransform<CGFloat>) {
        _transform.prepend(transform)
    }
}

public extension MKAffineTransform where Float == CGFloat {
    mutating func append(_ transform: Affine2DTransform) {
        append(transform._transform)
    }

    mutating func prepend(_ transform: Affine2DTransform) {
        prepend(transform._transform)
    }
}
