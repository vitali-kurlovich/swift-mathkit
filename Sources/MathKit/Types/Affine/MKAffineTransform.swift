//
//  MKAffineTransform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 6.01.26.
//

import Foundation

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
