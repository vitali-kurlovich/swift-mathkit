//
//  Created by Vitali Kurlovich on 01.04.2026.
//

import MathKit
import Testing

extension MKAffineTransformTests {
    @Test("Scale")
    func scale() {
        #expect(
            MKAffineTransform<Double>.identity.scaled(6) == .scale(6)
        )

        var mk = MKAffineTransform<Double>.identity
        mk.scale(6)
        #expect(
            mk == .scale(6)
        )

        mk = .init(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)

        var tr = mk

        let expected = MKAffineTransform<Double>(m11: 10, m12: 20, m21: 30, m22: 40, tx: 5, ty: 6)

        #expect(
            mk.scaled(10) == expected
        )

        mk.scale(10)

        tr.prepend(.scale(10))

        #expect(mk == tr)
    }

    @Test("Scale - x: y:")
    func scaleXY() {
        #expect(
            MKAffineTransform<Double>.identity.scaled(x: 4, y: 7) == .scale(x: 4, y: 7)
        )

        var mk = MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        var tr = mk

        let expected = MKAffineTransform<Double>(m11: 10, m12: 20, m21: 60, m22: 80, tx: 5, ty: 6)

        #expect(
            mk.scaled(x: 10, y: 20) == expected
        )

        mk.scale(x: 10, y: 20)

        tr.prepend(.scale(x: 10, y: 20))

        #expect(mk == tr)
    }
}
