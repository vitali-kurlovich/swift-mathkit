//
//  Created by Vitali Kurlovich on 01.04.2026.
//

import MathKit
import Testing

private let tolerance: Double = 0.00000001

extension MKAffineTransformTests {
    @Test("Invert")
    func invert() throws {
        var mk = MKAffineTransform<Double>()
        mk.translate(x: 2, y: 5)
        mk.rotate(.radians(.pi / 4))
        mk.scale(x: 4, y: 3)
        mk.rotate(.radians(.pi / 4))

        var inv = MKAffineTransform<Double>()
        inv.rotate(.radians(-.pi / 4))
        inv.scale(x: 1 / 4, y: 1 / 3)
        inv.rotate(.radians(-.pi / 4))
        inv.translate(x: -2, y: -5)

        let inverted = try #require(mk.inverted())

        #expect(inv.isEqual(to: inverted, tolerance: tolerance))

        mk.invert()

        #expect(inv.isEqual(to: mk, tolerance: tolerance))
    }

    @Test("Invert point")
    func invertPoint() throws {
        var mk = MKAffineTransform<Double>()

        mk.translate(x: 2, y: 5)
        mk.rotate(.radians(.pi / 4))
        mk.scale(x: 4, y: 3)
        mk.rotate(.radians(.pi / 4))

        let inverted = try #require(mk.inverted())

        let point = MKPoint<Double>(x: 20, y: 50)

        #expect(
            mk.inverse(point).isEqual(to: inverted.transform(point), tolerance: tolerance)
        )
    }
}
