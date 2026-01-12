//
//  MKAffineTransform+SIMD.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 11.01.26.
//

import Foundation

public extension MKAffineTransform {
    /**
     Creates an affine transformation matrix from rotation value (angle in radians).
     The matrix takes the following form:

         [  cos α   sin α  0 ]
         [ -sin α   cos α  0 ]
         [    0       0    1 ]
     */

    @inlinable init(_ angle: MKAngle<Float>) where Float == Double {
        let (s, c) = angle.sincos
        self.init(m11: c, m12: s,
                  m21: -s, m22: c,
                  tx: 0, ty: 0)
    }

    @inlinable init(_ angle: MKAngle<Float>) where Float == Swift.Float {
        let (s, c) = angle.sincos
        self.init(m11: c, m12: s,
                  m21: -s, m22: c,
                  tx: 0, ty: 0)
    }

    @inlinable init(_ angle: MKAngle<Float>) where Float == CGFloat {
        let (s, c) = angle.sincos
        self.init(m11: c, m12: s,
                  m21: -s, m22: c,
                  tx: 0, ty: 0)
    }

    @inlinable init(_ angle: MKAngle<Float>) where Float == Float16 {
        let (s, c) = angle.sincos
        self.init(m11: c, m12: s,
                  m21: -s, m22: c,
                  tx: 0, ty: 0)
    }
}

public extension MKAffineTransform {
    /**
     Mutates an affine transformation matrix from a rotation value (angle α in radians).
     The matrix takes the following form:

     [  cos α   sin α  0 ]
     [ -sin α   cos α  0 ]
     [    0       0    1 ]
     */
    mutating func rotate(_ angle: MKAngle<Float>) where Float == Double {
        let (s, c) = angle.sincos
        rotate(s: s, c: c)
    }

    mutating func rotate(_ angle: MKAngle<Float>) where Float == Swift.Float {
        let (s, c) = angle.sincos
        rotate(s: s, c: c)
    }

    mutating func rotate(_ angle: MKAngle<Float>) where Float == CGFloat {
        let (s, c) = angle.sincos
        rotate(s: s, c: c)
    }

    mutating func rotate(_ angle: MKAngle<Float>) where Float == Float16 {
        let (s, c) = angle.sincos
        rotate(s: s, c: c)
    }
}

extension MKAffineTransform {
    private mutating func rotate(s: Float, c: Float) {
        let m11 = self.m11
        let m12 = self.m12

        self.m11 *= c
        self.m11.addProduct(m21, s)

        self.m12 *= c
        self.m12.addProduct(m22, s)

        m21 *= c
        m21.addProduct(-m11, s)

        m22 *= c
        m22.addProduct(-m12, s)
    }
}
