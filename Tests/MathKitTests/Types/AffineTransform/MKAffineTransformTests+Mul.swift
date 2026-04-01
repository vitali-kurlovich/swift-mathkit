//
//  Created by Vitali Kurlovich on 01.04.2026.
//

import MathKit
import Testing

private let tolerance: Double = 0.00000001

extension MKAffineTransformTests {
    @Test("Append")
    func append() {
        var mk1 = MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        let mk2 = MKAffineTransform<Double>(m11: 7, m12: 8, m21: 9, m22: 10, tx: 11, ty: 12)

        mk1.append(mk2)

        #expect(mk1 == .init(m11: 25.0, m12: 28.0, m21: 57.0, m22: 64.0, tx: 100.0, ty: 112.0))
    }

    @Test("Prepend")
    func prepend() {
        var mk1 = MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        let mk2 = MKAffineTransform<Double>(m11: 7, m12: 8, m21: 9, m22: 10, tx: 11, ty: 12)

        mk1.prepend(mk2)

        #expect(mk1 == .init(m11: 31.0, m12: 46.0, m21: 39.0, m22: 58.0, tx: 52.0, ty: 76.0))
    }
}
