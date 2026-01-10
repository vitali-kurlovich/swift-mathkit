//
//  Affine2DTransform+Modify.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 29.12.25.
//

import Foundation
import RealModule

// Rotation
public extension Affine2DTransform {
    init(rotation: MKAngle<Float>) where Float: Real {
        let transform = MKAffineTransform(rotation)
        self.init(transform)
    }

    mutating func rotate(_ angle: MKAngle<Float>) where Float: Real {
        _transform.rotate(angle)
    }
}

// Scale
public extension Affine2DTransform {
    @inlinable init(scale: Float) {
        self.init(.init(scale: scale))
    }

    @inlinable init(scaleByX x: Float, byY y: Float) {
        self.init(.init(scaleByX: x, byY: y))
    }

    mutating func scale(_ scale: Float) {
        _transform.scale(scale)
    }

    mutating func scale(x: Float, y: Float) {
        _transform.scale(x: x, y: y)
    }
}

// Translate
public extension Affine2DTransform {
    @inlinable init(translationByX x: Float, byY y: Float) {
        self.init(.init(translationByX: x, byY: y))
    }

    mutating func translate(x: Float, y: Float) {
        _transform.translate(x: x, y: y)
    }
}

public extension Affine2DTransform {
    mutating func append(_ transform: Self) {
        _transform.append(transform._transform)
    }

    mutating func append(_ transform: MKAffineTransform<Float>) {
        _transform.append(transform)
    }

    mutating func prepend(_ transform: Self) {
        _transform.prepend(transform._transform)
    }

    mutating func prepend(_ transform: MKAffineTransform<Float>) {
        _transform.prepend(transform)
    }
}

public extension MKAffineTransform {
    mutating func append(_ transform: Affine2DTransform<Float>) {
        append(transform._transform)
    }

    mutating func prepend(_ transform: Affine2DTransform<Float>) {
        prepend(transform._transform)
    }
}
