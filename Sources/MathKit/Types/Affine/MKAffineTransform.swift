//
//  MKAffineTransform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 6.01.26.
//

import Foundation
import RealModule

public nonisolated struct MKAffineTransform<Float: FloatingPoint & Sendable>: Hashable, Sendable {
    public var m11: Float
    public var m12: Float
    public var m21: Float
    public var m22: Float
    public var tx: Float
    public var ty: Float

    @inlinable public init(m11: Float, m12: Float, m21: Float, m22: Float, tx: Float, ty: Float) {
        self.m11 = m11
        self.m12 = m12
        self.m21 = m21
        self.m22 = m22
        self.tx = tx
        self.ty = ty
    }
}

public extension MKAffineTransform {
    @inlinable static var identity: Self {
        .init(m11: 1, m12: 0,
              m21: 0, m22: 1,
              tx: 0, ty: 0)
    }
}

public extension MKAffineTransform {
    @inlinable init() {
        self.init(m11: 1, m12: 0,
                  m21: 0, m22: 1,
                  tx: 0, ty: 0)
    }
}

public extension MKAffineTransform {
    /**
     Creates an affine transformation matrix from translation values.
     The matrix takes the following form:

         [ 1  0  0 ]
         [ 0  1  0 ]
         [ x  y  1 ]
     */
    @inlinable init(translationByX x: Float, byY y: Float) {
        self.init(m11: 1, m12: 0,
                  m21: 0, m22: 1,
                  tx: x, ty: y)
    }
}

public extension MKAffineTransform {
    /**
     Creates an affine transformation matrix from scaling values.
     The matrix takes the following form:

     [ x  0  0 ]
     [ 0  y  0 ]
     [ 0  0  1 ]
     */
    @inlinable init(scaleByX x: Float, byY y: Float) {
        self.init(m11: x, m12: 0,
                  m21: 0, m22: y,
                  tx: 0, ty: 0)
    }

    /**
     Creates an affine transformation matrix from scaling a single value.
     The matrix takes the following form:

     [ f  0  0 ]
     [ 0  f  0 ]
     [ 0  0  1 ]
     */
    @inlinable init(scale factor: Float) {
        self.init(scaleByX: factor, byY: factor)
    }
}

public extension MKAffineTransform {
    /**
     Creates an affine transformation matrix from rotation value (angle in radians).
     The matrix takes the following form:

         [  cos α   sin α  0 ]
         [ -sin α   cos α  0 ]
         [    0       0    1 ]
     */

    @inlinable init(_ angle: MKAngle<Float>) where Float: Real {
        let s = Float.sin(angle.radians)
        let c = Float.cos(angle.radians)

        self.init(m11: c, m12: s,
                  m21: -s, m22: c,
                  tx: 0, ty: 0)
    }
}

// Invert
public extension MKAffineTransform {
    @inlinable var determinant: Float {
        (m11 * m22).addingProduct(-m12, m21)
    }

    @inlinable mutating func invert() {
        let det = determinant

        let tx = self.tx

        self.tx = (m21 * ty).addingProduct(-m22, tx) / det
        ty = (m12 * tx).addingProduct(-m11, ty) / det

        m12 = -m12 / det
        m21 = -m21 / det

        let m11 = self.m11

        self.m11 = m22 / det
        m22 = m11 / det
    }

    @inlinable func inverted() -> Self? {
        let det = determinant

        guard det > Float.ulpOfOne else {
            return nil
        }

        return MKAffineTransform(m11: m22 / det, m12: -m12 / det,
                                 m21: -m21 / det, m22: m11 / det,
                                 tx: (m21 * ty - m22 * tx) / det,
                                 ty: (m12 * tx - m11 * ty) / det)
    }
}

public extension MKAffineTransform {
    @inlinable mutating func translate(x: Float, y: Float) {
        tx += (m11 * x).addingProduct(m21, y)
        ty += (m12 * x).addingProduct(m22, y)
    }

    /**
     Mutates an affine transformation matrix from a rotation value (angle α in radians).
     The matrix takes the following form:

         [  cos α   sin α  0 ]
         [ -sin α   cos α  0 ]
         [    0       0    1 ]
     */
    mutating func rotate(_ angle: MKAngle<Float>) where Float: Real {
        let m11 = self.m11, m12 = self.m12
        let m21 = self.m21, m22 = self.m22

        let s = Float.sin(angle.radians)
        let c = Float.cos(angle.radians)

        self.m11 = c * m11 + m21 * s
        self.m12 = c * m12 + m22 * s

        self.m21 = c * m21 - m11 * s
        self.m22 = c * m22 - m12 * s
    }

    @inlinable mutating func scale(_ scale: Float) {
        m11 *= scale
        m12 *= scale
        m21 *= scale
        m22 *= scale
    }

    @inlinable mutating func scale(x: Float, y: Float) {
        m11 *= x
        m12 *= x

        m21 *= y
        m22 *= y
    }

    @inlinable mutating func prepend(_ transform: Self) {
        let a11 = m11, a12 = m12
        let a21 = m21, a22 = m22
        let ax = tx, ay = ty

        let b11 = transform.m11, b12 = transform.m12
        let b21 = transform.m21, b22 = transform.m22
        let bx = transform.tx, by = transform.ty

        m11 = a11 * b11 + a21 * b12
        m12 = a12 * b11 + a22 * b12

        m21 = a11 * b21 + a21 * b22
        m22 = a12 * b21 + a22 * b22

        tx = ax + a11 * bx + a21 * by
        ty = ay + a12 * bx + a22 * by
    }

    @inlinable mutating func append(_ transform: Self) {
        let a11 = m11, a12 = m12
        let a21 = m21, a22 = m22
        let ax = tx, ay = ty

        let b11 = transform.m11, b12 = transform.m12
        let b21 = transform.m21, b22 = transform.m22
        let bx = transform.tx, by = transform.ty

        m11 = a11 * b11 + a12 * b21
        m12 = a11 * b12 + a12 * b22

        m21 = a21 * b11 + a22 * b21
        m22 = a21 * b12 + a22 * b22

        tx = ax * b11 + ay * b21 + bx
        ty = ax * b12 + ay * b22 + by
    }
}
