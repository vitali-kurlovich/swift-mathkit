//
//  Created by Vitali Kurlovich on 01.04.2026.
//

import MathKit
import Testing

private let tolerance: Double = 0.00000001

extension MKAffineTransformTests {
    @Test("Init translation")
    func initTranslation() {
        #expect(MKAffineTransform<Double>(translationByX: 3, byY: 6) == .init(m11: 1.0, m12: 0.0, m21: 0.0, m22: 1.0, tx: 3.0, ty: 6.0))
        #expect(MKAffineTransform<Double>(translationByX: 3, byY: 6) == .translation(x: 3, y: 6))
    }

    @Test("Translate")
    func translate() {
        var mk = MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)

        let expected = MKAffineTransform<Double>(m11: 1.0, m12: 2.0, m21: 3.0, m22: 4.0, tx: 115.0, ty: 166.0)

        let vector = MKVector<Double>(dx: 20, dy: 30)

        #expect(mk.translated(vector) == expected)

        mk.translate(vector)

        #expect(mk == expected)

        var tr = MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        tr.prepend(.translation(vector))

        #expect(mk == tr)
    }
}
