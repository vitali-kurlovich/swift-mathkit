//
//  ControlPointsTransform+UnitTransform2D.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 27.12.25.
//

import Foundation

extension ControlPointsTransform: UnitTransform2D {
    public func transform(_ source: UnitPoint) -> CGPoint {
        lerp(lerp(p0, p1, t: source.x), lerp(p3, p2, t: source.x), t: source.y)
    }
}
