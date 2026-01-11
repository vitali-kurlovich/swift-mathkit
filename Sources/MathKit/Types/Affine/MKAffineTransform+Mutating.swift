//
//  MKAffineTransform+Mutating.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 11.01.26.
//

public extension MKAffineTransform {
    @inlinable mutating func translate(x: Float, y: Float) {
        tx += (m11 * x).addingProduct(m21, y)
        ty += (m12 * x).addingProduct(m22, y)
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
        let ax = tx

        tx = transform.tx.addingProduct(tx, transform.m11).addingProduct(ty, transform.m21)
        ty = transform.ty.addingProduct(ax, transform.m12).addingProduct(ty, transform.m22)

        let a11 = m11
        m11 *= transform.m11
        m11.addProduct(m12, transform.m21)

        m12 = (a11 * transform.m12).addingProduct(m12, transform.m22)

        let a21 = m21
        m21 *= transform.m11
        m21.addProduct(m22, transform.m21)

        m22 = (a21 * transform.m12).addingProduct(m22, transform.m22)
    }
}
