//
//  Created by Vitali Kurlovich on 01.04.2026.
//

import Foundation
import MathKit
import Testing

#if canImport(CoreGraphics)
    import CoreGraphics
#endif

private let tolerance: Double = 0.00000001

extension MKAffineTransformTests {
    @Test("Constructor translation <Double>", arguments: [
        (0, 0, MKAffineTransform<Double>.identity),
        (2, 3, MKAffineTransform<Double>(m11: 1.0, m12: 0.0, m21: 0.0, m22: 1.0, tx: 2.0, ty: 3.0)),
    ])
    func initTranslation(_ args: (Double, Double, MKAffineTransform<Double>)) {
        let (offsetX, offsetY, expect) = args
        let point = MKPoint<Double>(x: offsetX, y: offsetY)
        let vector = MKVector(dx: offsetX, dy: offsetY)

        #expect(MKAffineTransform<Double>(translationX: offsetX, y: offsetY).isEqual(to: expect, tolerance: tolerance))
        #expect(MKAffineTransform<Double>(translationByX: offsetX, byY: offsetY).isEqual(to: expect, tolerance: tolerance))
        #expect(MKAffineTransform<Double>(point).isEqual(to: expect, tolerance: tolerance))
        #expect(MKAffineTransform<Double>(vector).isEqual(to: expect, tolerance: tolerance))

        #expect(MKAffineTransform<Double>.translation(x: offsetX, y: offsetY).isEqual(to: expect, tolerance: tolerance))
        #expect(MKAffineTransform<Double>.translation(point).isEqual(to: expect, tolerance: tolerance))
        #expect(MKAffineTransform<Double>.translation(vector).isEqual(to: expect, tolerance: tolerance))

        #if canImport(CoreGraphics)

            let cg = CGAffineTransform(translationX: offsetX, y: offsetY)
            #expect(MKAffineTransform<Double>(cg).isEqual(to: expect, tolerance: tolerance))

        #endif

        #if os(macOS)
            let affine = AffineTransform(translationByX: offsetX, byY: offsetY)
            #expect(MKAffineTransform<Double>(affine).isEqual(to: expect, tolerance: tolerance))
        #endif
    }

    @Test("Translate <Double>", arguments: [
        (0, 0, MKAffineTransform<Double>.identity, MKAffineTransform<Double>.identity),
        (2, 3, MKAffineTransform<Double>.identity, MKAffineTransform<Double>(m11: 1.0, m12: 0.0, m21: 0.0, m22: 1.0, tx: 2.0, ty: 3.0)),

        (20, 30,
         MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6),
         MKAffineTransform<Double>(m11: 1.0, m12: 2.0, m21: 3.0, m22: 4.0, tx: 115.0, ty: 166.0)),

    ])
    func translate(_ args: (Double, Double, MKAffineTransform<Double>, MKAffineTransform<Double>)) {
        let (offsetX, offsetY, src, expect) = args
        let point = MKPoint<Double>(x: offsetX, y: offsetY)
        let vector = MKVector(dx: offsetX, dy: offsetY)

        #expect(
            src.translatedBy(x: offsetX, y: offsetY).isEqual(to: expect, tolerance: tolerance)
        )

        #expect(
            src.translated(x: offsetX, y: offsetY).isEqual(to: expect, tolerance: tolerance)
        )

        #expect(
            src.translated(point).isEqual(to: expect, tolerance: tolerance)
        )

        #expect(
            src.translated(vector).isEqual(to: expect, tolerance: tolerance)
        )

        var tr = src
        tr.translate(x: offsetX, y: offsetY)
        #expect(tr.isEqual(to: expect, tolerance: tolerance))

        tr = src
        tr.translate(point)
        #expect(tr.isEqual(to: expect, tolerance: tolerance))

        tr = src
        tr.translate(vector)
        #expect(tr.isEqual(to: expect, tolerance: tolerance))

        #if canImport(CoreGraphics)

            var cg = CGAffineTransform(src)
            cg = cg.translatedBy(x: offsetX, y: offsetY)
            #expect(MKAffineTransform<Double>(cg).isEqual(to: expect, tolerance: tolerance))

        #endif

        #if os(macOS)
            var affine = AffineTransform(src)
            affine.translate(x: offsetX, y: offsetY)
            #expect(MKAffineTransform<Double>(affine).isEqual(to: expect, tolerance: tolerance))
        #endif
    }
}
