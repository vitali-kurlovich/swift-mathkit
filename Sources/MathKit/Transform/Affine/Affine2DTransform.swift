//
//  Affine2DTransform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 28.12.25.
//

import Foundation

public struct Affine2DTransform: Hashable, Sendable {
    var _transform: AffineTransform

    public init() {
        self.init(AffineTransform.identity)
    }

    public init(_ transform: AffineTransform) {
        _transform = transform
    }
}

public extension Affine2DTransform {
    @inlinable static var identity: Self {
        .init(AffineTransform.identity)
    }
}

public extension Affine2DTransform {
    @inlinable init(m11: CGFloat, m12: CGFloat, m21: CGFloat, m22: CGFloat, tx: CGFloat = 0, ty: CGFloat = 0) {
        self.init(.init(m11: m11, m12: m12, m21: m21, m22: m22, tX: tx, tY: ty))
    }
}

// Rotation
public extension Affine2DTransform {
    init(rotation: Angle) {
        let transform = AffineTransform(rotationByRadians: rotation.radians)
        self.init(transform)
    }

    mutating func rotate(_ angle: Angle) {
        _transform.rotate(byRadians: angle.radians)
    }
}

// Scale
public extension Affine2DTransform {
    @inlinable init(scale: CGFloat) {
        self.init(AffineTransform(scale: scale))
    }

    @inlinable init(scaleByX x: CGFloat, byY y: CGFloat) {
        self.init(AffineTransform(scaleByX: x, byY: y))
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
        self.init(AffineTransform(translationByX: x, byY: y))
    }

    mutating func translate(x: CGFloat, y: CGFloat) {
        _transform.translate(x: x, y: y)
    }
}

public extension Affine2DTransform {
    var m11: CGFloat {
        get {
            _transform.m11
        }
        set {
            _transform.m11 = newValue
        }
    }

    var m12: CGFloat {
        get {
            _transform.m12
        }
        set {
            _transform.m12 = newValue
        }
    }

    var m21: CGFloat {
        get {
            _transform.m21
        }
        set {
            _transform.m21 = newValue
        }
    }

    var m22: CGFloat {
        get {
            _transform.m22
        }
        set {
            _transform.m22 = newValue
        }
    }

    var tx: CGFloat {
        get {
            _transform.tX
        }
        set {
            _transform.tX = newValue
        }
    }

    var ty: CGFloat {
        get {
            _transform.tY
        }
        set {
            _transform.tY = newValue
        }
    }
}

public extension Affine2DTransform {
    var determinant: CGFloat {
        m11 * m22 - m12 * m21
    }

    func inverted() -> Self? {
        guard let inverted = _transform.inverted() else {
            return nil
        }

        return .init(inverted)
    }
}

public extension Affine2DTransform {
    mutating func append(_ transform: Self) {
        _transform.append(transform._transform)
    }

    mutating func append(_ transform: AffineTransform) {
        _transform.append(transform)
    }

    mutating func prepend(_ transform: Self) {
        _transform.prepend(transform._transform)
    }

    mutating func prepend(_ transform: AffineTransform) {
        _transform.prepend(transform)
    }
}

public extension AffineTransform {
    mutating func append(_ transform: Affine2DTransform) {
        append(transform._transform)
    }

    mutating func prepend(_ transform: Affine2DTransform) {
        prepend(transform._transform)
    }
}

public extension AffineTransform {
    init(_ affine: Affine2DTransform) {
        self = affine._transform
    }
}
