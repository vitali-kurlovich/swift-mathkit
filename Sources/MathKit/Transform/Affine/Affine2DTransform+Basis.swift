//
//  Affine2DTransform+Basis.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 29.12.25.
//

import Foundation

public extension Affine2DTransform {
    init(origin: CGPoint, basisU: CGVector, basisV: CGVector) {
        self.init(m11: basisU.dx, m12: basisV.dx,
                  m21: basisU.dy, m22: basisV.dy,
                  tx: origin.x, ty: origin.y)
    }

    var origin: CGPoint {
        _transform.transform(.init(x: 0, y: 0))
    }

    var basisU: CGVector {
        let basis = _transform.transform(.init(x: 1, y: 0))
        let origin = self.origin
        return .init(dx: basis.x - origin.x, dy: basis.y - origin.y)
    }

    var basisV: CGVector {
        let basis = _transform.transform(.init(x: 0, y: 1))
        let origin = self.origin
        return .init(dx: basis.x - origin.x, dy: basis.y - origin.y)
    }
}
