//
//  Created by Vitali Kurlovich on 01.04.2026.
//

import MathKit
import Testing

private let tolerance: Double = 0.00000001

// Init
extension MKAffineTransformTests {
    @Test("Init")
    func initTransform() {
        #expect(MKAffineTransform<Double>() == .identity)
        #expect(MKAffineTransform<Double>() == .init(m11: 1.0, m12: 0.0, m21: 0.0, m22: 1.0, tx: 0.0, ty: 0.0))
    }
}

// identity
extension MKAffineTransformTests {
    @Test("identity")
    func identity() {
        let tr = MKAffineTransform<Double>.identity

        #expect(tr.isIdentity)

        #expect(MKAffineTransform<Double>.scale(1).isIdentity)
        #expect(MKAffineTransform<Double>.scale(2).isIdentity == false)
        #expect(MKAffineTransform<Double>.scale(x: 0, y: 1).isIdentity == false)
        #expect(MKAffineTransform<Double>.scale(x: 1, y: 0).isIdentity == false)

        #expect(MKAffineTransform<Double>.rotation(.zero).isIdentity)
        #expect(MKAffineTransform<Double>.rotation(.degrees(2)).isIdentity == false)

        #expect(MKAffineTransform<Double>.translation(x: 0, y: 0).isIdentity)
        #expect(MKAffineTransform<Double>.translation(x: 1, y: 0).isIdentity == false)
        #expect(MKAffineTransform<Double>.translation(x: 0, y: 1).isIdentity == false)
    }
}
