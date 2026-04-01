//
//  Created by Vitali Kurlovich on 01.04.2026.
//

import MathKit
import Testing

private let tolerance: Double = 0.00000001

extension MKAffineTransformTests {
    @Test("Translate")
    func translate() {
        var mk = MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)

        let expected = MKAffineTransform<Double>(m11: 1.0, m12: 2.0, m21: 3.0, m22: 4.0, tx: 115.0, ty: 166.0)

        #expect(mk.translated(x: 20, y: 30) == expected)

        mk.translate(x: 20, y: 30)

        #expect(mk == expected)

        var tr = MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        tr.prepend(.translation(x: 20, y: 30))

        #expect(mk == tr)
    }
}
