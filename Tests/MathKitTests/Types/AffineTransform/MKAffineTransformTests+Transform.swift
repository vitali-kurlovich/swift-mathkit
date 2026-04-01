//
//  MKAffineTransformTests+Transform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 01.04.2026.
//

import MathKit
import Testing

private let tolerance: Double = 0.00000001

extension MKAffineTransformTests {
    @Test("Transform Point")
    func transform_point() {
        var mk = MKAffineTransform<Double>()
        let point = MKPoint<Double>(x: 20, y: 40)
        #expect(mk.transform(point) == point)

        mk.translate(x: 2, y: 5)
        mk.rotate(.radians(.pi / 4))
        mk.scale(x: 4, y: 3)
        mk.rotate(.radians(.pi / 4))

        #expect(mk.transform(point).isEqual(to: MKPoint(x: -128, y: 55), tolerance: tolerance))
    }

    @Test("Transform Rect")
    func transform_rect() {
        let mk = MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        let rect = MKRect<Double>(x: 20, y: 90, width: 200, height: 120)
        #expect(mk.transform(rect) == .init(x: 295.0, y: 406.0, width: 560.0, height: 880.0))
    }
}
