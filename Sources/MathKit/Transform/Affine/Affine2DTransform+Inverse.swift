//
//  Affine2DTransform+Inverse.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 29.12.25.
//

public extension Affine2DTransform {
    @inlinable var determinant: CGFloat {
        m11 * m22 - m12 * m21
    }

    func inverted() -> Self? {
        guard let inverted = _transform.inverted() else {
            return nil
        }

        return .init(inverted)
    }
}
