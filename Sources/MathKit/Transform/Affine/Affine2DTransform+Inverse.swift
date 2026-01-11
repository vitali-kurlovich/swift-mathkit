//
//  Affine2DTransform+Inverse.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 29.12.25.
//

public extension Affine2DTransform {
    var determinant: Float {
        _transform.determinant
    }

    func inverted() -> Self? {
        guard let inverted = _transform.inverted() else {
            return nil
        }
        return .init(inverted)
    }
}
