//
//  Created by Vitali Kurlovich on 01.04.2026.
//

import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.00000001

extension MKAffineTransformTests {
    @Test("Invert <Double>", arguments: [
        (MKAffineTransform<Double>.identity, MKAffineTransform<Double>.identity),

        (MKAffineTransform<Double>(scaleByX: 2, byY: 4), MKAffineTransform<Double>(scaleByX: 0.5, byY: 0.25)),

        (MKAffineTransform<Double>(translationX: 2, y: 4), MKAffineTransform<Double>(translationX: -2, y: -4)),

        (MKAffineTransform<Double>(MKAngle<Double>.radians(.pi)), MKAffineTransform<Double>(MKAngle<Double>.radians(-.pi))),

        (MKAffineTransform<Double>(MKAngle<Double>.radians(.pi / 4)), MKAffineTransform<Double>(MKAngle<Double>.radians(-.pi / 4))),

        (
            MKAffineTransform<Double>(translation: .init(dx: 2, dy: -4),
                                      rotation: .degrees(-120),
                                      scale: .init(width: 5, height: 4)),

            MKAffineTransform<Double>(scaleX: 0.2, y: 0.25).rotated(.degrees(120)).translated(x: -2, y: 4)
        ),

    ])
    func invertDouble(_ args: (MKAffineTransform<Double>, MKAffineTransform<Double>)) throws {
        let (tr, expect) = args

        let inverted = try #require(tr.inverted())
        #expect(inverted.isEqual(to: expect, tolerance: tolerance))

        var t = tr
        t.invert()
        #expect(t.isEqual(to: expect, tolerance: tolerance))

        let points: [MKPoint<Double>] = [
            .zero,
            MKPoint<Double>(x: 0, y: 2),
            MKPoint<Double>(x: 2, y: 6),
            MKPoint<Double>(x: 2, y: 0),

            MKPoint<Double>(x: 0, y: -2),
            MKPoint<Double>(x: -2, y: -6),
            MKPoint<Double>(x: -2, y: 0),
        ]

        for p in points {
            let tp = p.applying(tr)

            #expect(tp.applying(inverted).isEqual(to: p, tolerance: tolerance))
            #expect(tr.inverse(tp).isEqual(to: p, tolerance: tolerance))
            #expect(tp.applyingInverse(tr).isEqual(to: p, tolerance: tolerance))

            #if canImport(CoreGraphics)
                let cg = CGAffineTransform(tr)
                let cgInverted = cg.inverted()

                let cg_tp = CGPoint(p).applying(cg)
                #expect(
                    MKPoint<Double>(cg_tp.applying(cgInverted)).isEqual(to: p, tolerance: tolerance)
                )
            #endif
        }

        #expect(tr.scaled(x: 0, y: 1).inverted() == nil)
        #expect(tr.scaled(x: 1, y: 0).inverted() == nil)
        #expect(tr.scaled(x: 0, y: 0).inverted() == nil)

        #if canImport(CoreGraphics)
            let cg = CGAffineTransform(tr)
            #expect(MKAffineTransform<Double>(cg.inverted()).isEqual(to: expect, tolerance: tolerance))
        #endif

        #if os(macOS)
            var affine = AffineTransform(tr)
            let affineInverted = try #require(affine.inverted())

            #expect(MKAffineTransform<Double>(affineInverted).isEqual(to: expect, tolerance: tolerance))

            affine.invert()
            #expect(MKAffineTransform<Double>(affine).isEqual(to: expect, tolerance: tolerance))

        #endif
    }
}
