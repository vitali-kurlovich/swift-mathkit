//
//  Created by Vitali Kurlovich on 01.04.2026.
//

import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.00000001
private let halfTolerance: Float32 = 0.0001
private let lowTolerance: Float16 = 0.01

extension MKAffineTransformTests {
    @Test("Init rotation")
    func initRotate() {
        #expect(MKAffineTransform<Double>(MKAngle())
            .isEqual(to: .init(m11: 1.0, m12: 0.0, m21: 0.0, m22: 1.0, tx: 0.0, ty: 0.0), tolerance: tolerance)
        )

        #expect(MKAffineTransform<Double>(.radians(.pi / 2)) == .rotation(.radians(.pi / 2)))

        #expect(
            MKAffineTransform<Double>(.radians(.pi / 2))
                .isEqual(to: .init(m11: 0, m12: 1.0, m21: -1.0, m22: 0, tx: 0.0, ty: 0.0), tolerance: tolerance)
        )

        #expect(MKAffineTransform<Double>(.radians(.pi))
            .isEqual(to: .init(m11: -1.0, m12: 0, m21: 0, m22: -1.0, tx: 0.0, ty: 0.0), tolerance: tolerance))

        #expect(MKAffineTransform<Double>(.radians(.pi / 8))
            .isEqual(to: .init(m11: 0.9238795325112866, m12: 0.3826834323650898,
                               m21: -0.3826834323650898, m22: 0.9238795325112866,
                               tx: 0.0, ty: 0.0), tolerance: tolerance))

        #expect(MKAffineTransform<Double>(.degrees(66))
            .isEqual(to: .init(m11: 0.4067366430758002, m12: 0.9135454576426009,
                               m21: -0.9135454576426009, m22: 0.4067366430758002,
                               tx: 0.0, ty: 0.0), tolerance: tolerance))
    }

    @Test("Rotate<Double>")
    func rotateDouble() {
        var mk = MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)

        #expect(mk.rotated(.zero).isEqual(to: mk, tolerance: tolerance))

        let expected = MKAffineTransform<Double>(m11: 2.8284271247461903, m12: 4.242640687119286,
                                                 m21: 1.4142135623730954, m22: 1.4142135623730956,
                                                 tx: 5.0, ty: 6.0)

        #expect(mk.rotated(.radians(.pi / 4)).isEqual(to: expected, tolerance: tolerance))

        mk.rotate(.radians(.pi / 4))

        #expect(mk.isEqual(to: expected, tolerance: tolerance))

        var tr = MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        tr.prepend(.rotation(.radians(.pi / 4)))

        #expect(mk.isEqual(to: tr, tolerance: tolerance))
    }

    @Test("Rotate<Float>")
    func rotateFloat() {
        var mk = MKAffineTransform<Float>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)

        #expect(mk.rotated(.zero).isEqual(to: mk, tolerance: halfTolerance))

        let expected = MKAffineTransform<Float>(m11: 2.8284271247461903, m12: 4.242640687119286,
                                                m21: 1.4142135623730954, m22: 1.4142135623730956,
                                                tx: 5.0, ty: 6.0)

        #expect(mk.rotated(.radians(.pi / 4)).isEqual(to: expected, tolerance: halfTolerance))

        mk.rotate(.radians(.pi / 4))

        #expect(mk.isEqual(to: expected, tolerance: halfTolerance))

        var tr = MKAffineTransform<Float>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        tr.prepend(.rotation(.radians(.pi / 4)))

        #expect(mk.isEqual(to: tr, tolerance: halfTolerance))
    }

    @Test("Rotate<Float16>")
    func rotateFloat16() {
        var mk = MKAffineTransform<Float16>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)

        #expect(mk.rotated(.zero).isEqual(to: mk, tolerance: lowTolerance))

        let expected = MKAffineTransform<Float16>(m11: 2.8284271247461903, m12: 4.242640687119286,
                                                  m21: 1.4142135623730954, m22: 1.4142135623730956,
                                                  tx: 5.0, ty: 6.0)

        #expect(mk.rotated(.radians(.pi / 4)).isEqual(to: expected, tolerance: lowTolerance))

        mk.rotate(.radians(.pi / 4))

        #expect(mk.isEqual(to: expected, tolerance: lowTolerance))

        var tr = MKAffineTransform<Float16>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        tr.prepend(.rotation(.radians(.pi / 4)))

        #expect(mk.isEqual(to: tr, tolerance: lowTolerance))
    }

    @Test("Rotate<CGFloat>")
    func rotateCGFloat() {
        var mk = MKAffineTransform<CGFloat>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)

        #expect(mk.rotated(.zero).isEqual(to: mk, tolerance: tolerance))

        let expected = MKAffineTransform<CGFloat>(m11: 2.8284271247461903, m12: 4.242640687119286,
                                                  m21: 1.4142135623730954, m22: 1.4142135623730956,
                                                  tx: 5.0, ty: 6.0)

        #expect(mk.rotated(.radians(.pi / 4)).isEqual(to: expected, tolerance: CGFloat(tolerance)))

        mk.rotate(.radians(.pi / 4))

        #expect(mk.isEqual(to: expected, tolerance: CGFloat(tolerance)))

        var tr = MKAffineTransform<CGFloat>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        tr.prepend(.rotation(.radians(.pi / 4)))

        #expect(mk.isEqual(to: tr, tolerance: CGFloat(tolerance)))
    }
}
