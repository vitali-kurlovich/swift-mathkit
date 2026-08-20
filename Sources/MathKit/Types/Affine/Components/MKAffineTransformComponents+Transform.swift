//
//  Created by Vitali Kurlovich on 07.04.2026.
//

import Foundation

public extension MKAffineTransformComponents where Float: BinaryFloatingPoint {
    @inlinable var affine: MKAffineTransform<Float> {
        MKAffineTransform(self)
    }

    @inlinable var inverseAffine: MKAffineTransform<Float> {
        let offsetX = -translation.dx
        let offsetY = -translation.dy

        let scaleX = 1 / scale.width
        let scaleY = 1 / scale.height

        if rotation == .zero {
            if scale == .identity {
                return .init(m11: 1, m12: 0,
                             m21: 0, m22: 1,
                             tx: offsetX, ty: offsetY)
            } else {
                return .init(m11: scaleX, m12: 0,
                             m21: 0, m22: scaleY,
                             tx: scaleX * offsetX, ty: scaleY * offsetY)
            }

        } else {
            let (s, c) = (-rotation).sincos

            let m11 = scaleX * c
            let m12 = scaleY * s

            let m21 = -scaleX * s
            let m22 = scaleY * c

            let tx = (m11 * offsetX) + (m21 * offsetY)
            let ty = (m12 * offsetX) + (m22 * offsetY)

            return .init(m11: m11, m12: m12, m21: m21, m22: m22, tx: tx, ty: ty)
        }
    }

    @inlinable
    func transform(_ point: MKPoint<Float>) -> MKPoint<Float> {
        let tx = translation.dx
        let ty = translation.dy

        let scaleX = scale.width
        let scaleY = scale.height

        if rotation == .zero {
            if scale == .identity {
                return point + translation
            } else {
                return .init(x: tx.addingProduct(scaleX, point.x),
                             y: ty.addingProduct(scaleY, point.y))
            }

        } else {
            let (s, c) = rotation.sincos

            return .init(x: tx.addingProduct(c * scaleX, point.x).addingProduct(-s * scaleY, point.y),
                         y: ty.addingProduct(s * scaleX, point.x).addingProduct(c * scaleY, point.y))
        }
    }

    @inlinable
    func inverse(_ point: MKPoint<Float>) -> MKPoint<Float> {
        let t = point - translation

        if rotation == .zero {
            if scale == .identity {
                return t
            } else {
                return .init(x: t.x / scale.width,
                             y: t.y / scale.height)
            }

        } else {
            let (s, c) = (-rotation).sincos
            return .init(x: (c * t.x - s * t.y) / scale.width,
                         y: (c * t.y + s * t.x) / scale.height)
        }
    }
}

public extension MKPoint where Float: BinaryFloatingPoint {
    @inlinable func applying(_ t: MKAffineTransformComponents<Float>) -> Self {
        t.transform(self)
    }

    @inlinable func applyingInverse(_ t: MKAffineTransformComponents<Float>) -> Self {
        t.inverse(self)
    }
}
