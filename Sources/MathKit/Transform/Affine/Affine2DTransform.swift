//
//  Affine2DTransform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 28.12.25.
//

import Foundation

public struct Affine2DTransform: Hashable {
    var m11: CGFloat
    var m12: CGFloat
    var m21: CGFloat
    var m22: CGFloat
    var tx: CGFloat
    var ty: CGFloat

    public init(m11: CGFloat, m12: CGFloat, m21: CGFloat, m22: CGFloat, tx: CGFloat, ty: CGFloat) {
        self.m11 = m11
        self.m12 = m12
        self.m21 = m21
        self.m22 = m22
        self.tx = tx
        self.ty = ty
    }
}

public extension Affine2DTransform {
    var determinant: CGFloat {
        m11 * m22 - m12 * m21
    }

    var inverseTransform: Self? {
        let det = determinant

        guard det != 0 else {
            return nil
        }

        return .init(m11: m22 / det,
                     m12: -(m12 / det),
                     m21: -(m21 / det),
                     m22: m11 / det,
                     tx: (m21 * ty - m22 * tx) / det,
                     ty: (m12 * tx - m11 * ty) / det)
    }
}

public extension Affine2DTransform {
    init(_ affine: AffineTransform) {
        let d = CGAffineTransform.identity

        self.init(m11: affine.m11, m12: affine.m12, m21: affine.m21, m22: affine.m22, tx: affine.tX, ty: affine.tY)
    }
}

public extension AffineTransform {
    init(_ affine: Affine2DTransform) {
        self.init(m11: affine.m11, m12: affine.m12, m21: affine.m21, m22: affine.m22, tX: affine.tx, tY: affine.ty)
    }
}

/*

 */
