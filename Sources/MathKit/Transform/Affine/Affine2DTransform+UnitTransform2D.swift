//
//  Affine2DTransform+UnitTransform2D.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 29.12.25.
//

extension Affine2DTransform: UnitTransform2D {
    public func transform(_ source: UnitPoint) -> CGPoint {
        _transform.transform(.init(x: source.x, y: source.y))
    }
}
