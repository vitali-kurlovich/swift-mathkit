//
//  Created by Vitali Kurlovich on 01.04.2026.
//

import MathKit
import Testing

private let tolerance: Double = 0.00000001

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

    @Test("Rotate")
    func rotate() {
        var mk = MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        mk.rotate(MKAngle(radians: .pi / 4))

        #expect(
            mk.isEqual(to: .init(m11: 2.8284271247461903, m12: 4.242640687119286,
                                 m21: 1.4142135623730954, m22: 1.4142135623730956,
                                 tx: 5.0, ty: 6.0),
                       tolerance: tolerance)
        )

        var tr = MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        tr.prepend(.rotation(.radians(.pi / 4)))

        #expect(mk.isEqual(to: tr, tolerance: tolerance))
    }
}
