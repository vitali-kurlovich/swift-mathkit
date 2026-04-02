//
//  Created by Vitali Kurlovich on 02.04.2026.
//

import MathKit
import Testing

private let tolerance: Double = 0.00000001

extension MKAffineTransformTests {
    @Test("Transform fill",
          arguments: [
              (MKRect<Double>(x: 0, y: 0, width: 200, height: 100), MKRect<Double>(x: 0, y: 0, width: 200, height: 100)),
              (MKRect<Double>(x: 10, y: 20, width: 200, height: 100), MKRect<Double>(x: 10, y: 20, width: 200, height: 100)),
              (MKRect<Double>(x: -10, y: -20, width: 200, height: 100), MKRect<Double>(x: -10, y: -20, width: 200, height: 100)),
              (MKRect<Double>(x: 10, y: -20, width: 200, height: 100), MKRect<Double>(x: 10, y: -20, width: 200, height: 100)),
              (MKRect<Double>(x: -10, y: 20, width: 200, height: 100), MKRect<Double>(x: -10, y: 20, width: 200, height: 100)),

              (MKRect<Double>(x: 0, y: 0, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 20, height: 20)),
              (MKRect<Double>(x: 0, y: 0, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 10, height: 20)),
              (MKRect<Double>(x: 0, y: 0, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 20, height: 10)),
              (MKRect<Double>(x: 0, y: 0, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 80, height: 30)),

              (MKRect<Double>(x: 0, y: 0, width: 20, height: 10), MKRect<Double>(x: 10, y: 20, width: 200, height: 200)),
              (MKRect<Double>(x: 0, y: 0, width: 20, height: 10), MKRect<Double>(x: -10, y: 20, width: 100, height: 200)),
              (MKRect<Double>(x: 0, y: 0, width: 20, height: 10), MKRect<Double>(x: 10, y: -20, width: 200, height: 100)),
              (MKRect<Double>(x: 0, y: 0, width: 20, height: 10), MKRect<Double>(x: -33, y: -20, width: 80, height: 300)),

              (MKRect<Double>(x: 10, y: 60, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 20, height: 20)),
              (MKRect<Double>(x: -10, y: 60, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 10, height: 20)),
              (MKRect<Double>(x: -50, y: -40, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 20, height: 10)),
              (MKRect<Double>(x: -110, y: -120, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 80, height: 30)),

              (MKRect<Double>(x: 10, y: 60, width: 20, height: 10), MKRect<Double>(x: 10, y: 20, width: 200, height: 200)),
              (MKRect<Double>(x: -10, y: 60, width: 20, height: 10), MKRect<Double>(x: -10, y: 20, width: 100, height: 200)),
              (MKRect<Double>(x: -50, y: -40, width: 20, height: 10), MKRect<Double>(x: 10, y: -20, width: 200, height: 100)),
              (MKRect<Double>(x: -110, y: -120, width: 20, height: 10), MKRect<Double>(x: -33, y: -20, width: 80, height: 300)),

          ])
    func fillTransform(_ args: (MKRect<Double>, MKRect<Double>)) throws {
        let (src, dest) = args

        let tr = MKAffineTransform.transform(from: src, to: dest)

        #expect(tr.transform(src).isEqual(to: dest, tolerance: tolerance))

        #expect(
            src.applying(tr).size.isEqual(to: dest.size, tolerance: tolerance)
        )
    }

    @Test("Transform aspectFit", arguments: [
        (MKRect<Double>(x: 0, y: 0, width: 200, height: 100),
         MKRect<Double>(x: 10, y: 20, width: 200, height: 100),
         MKRect<Double>(x: 10, y: 20, width: 200, height: 100)),

        (MKRect<Double>(x: 0, y: 0, width: 200, height: 100),
         MKRect<Double>(x: 10, y: 20, width: 400, height: 200),
         MKRect<Double>(x: 10, y: 20, width: 400, height: 200)),

        (MKRect<Double>(x: 0, y: 0, width: 200, height: 100),
         MKRect<Double>(x: 10, y: 20, width: 420, height: 200),
         MKRect<Double>(x: 20, y: 20, width: 400, height: 200)),

        // ---

        (MKRect<Double>(x: 0, y: 0, width: 100, height: 200),
         MKRect<Double>(x: 10, y: 20, width: 100, height: 200),
         MKRect<Double>(x: 10, y: 20, width: 100, height: 200)),

        (MKRect<Double>(x: 0, y: 0, width: 100, height: 200),
         MKRect<Double>(x: 10, y: 20, width: 200, height: 400),
         MKRect<Double>(x: 10, y: 20, width: 200, height: 400)),

        (MKRect<Double>(x: 0, y: 0, width: 100, height: 200),
         MKRect<Double>(x: 10, y: 20, width: 200, height: 420),
         MKRect<Double>(x: 10, y: 30, width: 200, height: 400)),

    ])
    func aspectFitTransform(_ args: (MKRect<Double>, MKRect<Double>, MKRect<Double>)) throws {
        let (src, dest, expect) = args

        let tr = MKAffineTransform.transform(from: src, to: dest, scaleMode: .aspectFit)

        #expect(
            src.applying(tr).isEqual(to: expect, tolerance: tolerance)
        )

        #expect(
            src.size.aspectRatio.isEqual(to: expect.size.aspectRatio, tolerance: tolerance)
        )
    }

    @Test("Transform center", arguments: [
        (MKRect<Double>(x: 0, y: 0, width: 200, height: 100), MKRect<Double>(x: 0, y: 0, width: 200, height: 100)),
        (MKRect<Double>(x: 10, y: 20, width: 200, height: 100), MKRect<Double>(x: 10, y: 20, width: 200, height: 100)),
        (MKRect<Double>(x: -10, y: -20, width: 200, height: 100), MKRect<Double>(x: -10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: 10, y: -20, width: 200, height: 100), MKRect<Double>(x: 10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: -10, y: 20, width: 200, height: 100), MKRect<Double>(x: -10, y: 20, width: 200, height: 100)),

        (MKRect<Double>(x: 10, y: 60, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 20, height: 20)),
        (MKRect<Double>(x: -10, y: 60, width: 20, height: 510), MKRect<Double>(x: 0, y: 0, width: 10, height: 20)),
        (MKRect<Double>(x: -50, y: -40, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 20, height: 10)),
        (MKRect<Double>(x: -110, y: -120, width: 20, height: 710), MKRect<Double>(x: 0, y: 0, width: 80, height: 30)),

        (MKRect<Double>(x: 10, y: 60, width: 20, height: 410), MKRect<Double>(x: 10, y: 20, width: 200, height: 200)),
        (MKRect<Double>(x: -10, y: 60, width: 320, height: 10), MKRect<Double>(x: -10, y: 20, width: 100, height: 200)),
        (MKRect<Double>(x: -50, y: -40, width: 20, height: 10), MKRect<Double>(x: 10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: -110, y: -120, width: 420, height: 10), MKRect<Double>(x: -33, y: -20, width: 80, height: 300)),
    ])
    func centerTransform(_ args: (MKRect<Double>, MKRect<Double>)) throws {
        let (src, dest) = args

        let tr = MKAffineTransform.transform(from: src, to: dest, scaleMode: .center)

        #expect(
            src.applying(tr).center.isEqual(to: dest.center, tolerance: tolerance)
        )

        #expect(
            src.applying(tr).size.isEqual(to: src.size, tolerance: tolerance)
        )
    }

    @Test("Transform top", arguments: [
        (MKRect<Double>(x: 0, y: 0, width: 200, height: 100), MKRect<Double>(x: 0, y: 0, width: 200, height: 100)),
        (MKRect<Double>(x: 10, y: 20, width: 200, height: 100), MKRect<Double>(x: 10, y: 20, width: 200, height: 100)),
        (MKRect<Double>(x: -10, y: -20, width: 200, height: 100), MKRect<Double>(x: -10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: 10, y: -20, width: 200, height: 100), MKRect<Double>(x: 10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: -10, y: 20, width: 200, height: 100), MKRect<Double>(x: -10, y: 20, width: 200, height: 100)),

        (MKRect<Double>(x: 10, y: 60, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 20, height: 20)),
        (MKRect<Double>(x: -10, y: 60, width: 20, height: 510), MKRect<Double>(x: 0, y: 0, width: 10, height: 20)),
        (MKRect<Double>(x: -50, y: -40, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 20, height: 10)),
        (MKRect<Double>(x: -110, y: -120, width: 20, height: 710), MKRect<Double>(x: 0, y: 0, width: 80, height: 30)),

        (MKRect<Double>(x: 10, y: 60, width: 20, height: 410), MKRect<Double>(x: 10, y: 20, width: 200, height: 200)),
        (MKRect<Double>(x: -10, y: 60, width: 320, height: 10), MKRect<Double>(x: -10, y: 20, width: 100, height: 200)),
        (MKRect<Double>(x: -50, y: -40, width: 20, height: 10), MKRect<Double>(x: 10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: -110, y: -120, width: 420, height: 10), MKRect<Double>(x: -33, y: -20, width: 80, height: 300)),
    ])
    func topTransform(_ args: (MKRect<Double>, MKRect<Double>)) throws {
        let (src, dest) = args

        let tr = MKAffineTransform.transform(from: src, to: dest, scaleMode: .top)

        #expect(
            src.applying(tr).top.isEqual(to: dest.top, tolerance: tolerance)
        )

        #expect(
            src.applying(tr).size.isEqual(to: src.size, tolerance: tolerance)
        )
    }

    @Test("Transform bottom", arguments: [
        (MKRect<Double>(x: 0, y: 0, width: 200, height: 100), MKRect<Double>(x: 0, y: 0, width: 200, height: 100)),
        (MKRect<Double>(x: 10, y: 20, width: 200, height: 100), MKRect<Double>(x: 10, y: 20, width: 200, height: 100)),
        (MKRect<Double>(x: -10, y: -20, width: 200, height: 100), MKRect<Double>(x: -10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: 10, y: -20, width: 200, height: 100), MKRect<Double>(x: 10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: -10, y: 20, width: 200, height: 100), MKRect<Double>(x: -10, y: 20, width: 200, height: 100)),

        (MKRect<Double>(x: 10, y: 60, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 20, height: 20)),
        (MKRect<Double>(x: -10, y: 60, width: 20, height: 510), MKRect<Double>(x: 0, y: 0, width: 10, height: 20)),
        (MKRect<Double>(x: -50, y: -40, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 20, height: 10)),
        (MKRect<Double>(x: -110, y: -120, width: 20, height: 710), MKRect<Double>(x: 0, y: 0, width: 80, height: 30)),

        (MKRect<Double>(x: 10, y: 60, width: 20, height: 410), MKRect<Double>(x: 10, y: 20, width: 200, height: 200)),
        (MKRect<Double>(x: -10, y: 60, width: 320, height: 10), MKRect<Double>(x: -10, y: 20, width: 100, height: 200)),
        (MKRect<Double>(x: -50, y: -40, width: 20, height: 10), MKRect<Double>(x: 10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: -110, y: -120, width: 420, height: 10), MKRect<Double>(x: -33, y: -20, width: 80, height: 300)),
    ])
    func bottomTransform(_ args: (MKRect<Double>, MKRect<Double>)) throws {
        let (src, dest) = args

        let tr = MKAffineTransform.transform(from: src, to: dest, scaleMode: .bottom)

        #expect(
            src.applying(tr).bottom.isEqual(to: dest.bottom, tolerance: tolerance)
        )

        #expect(
            src.applying(tr).size.isEqual(to: src.size, tolerance: tolerance)
        )
    }

    @Test("Transform Left", arguments: [
        (MKRect<Double>(x: 0, y: 0, width: 200, height: 100), MKRect<Double>(x: 0, y: 0, width: 200, height: 100)),
        (MKRect<Double>(x: 10, y: 20, width: 200, height: 100), MKRect<Double>(x: 10, y: 20, width: 200, height: 100)),
        (MKRect<Double>(x: -10, y: -20, width: 200, height: 100), MKRect<Double>(x: -10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: 10, y: -20, width: 200, height: 100), MKRect<Double>(x: 10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: -10, y: 20, width: 200, height: 100), MKRect<Double>(x: -10, y: 20, width: 200, height: 100)),

        (MKRect<Double>(x: 10, y: 60, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 20, height: 20)),
        (MKRect<Double>(x: -10, y: 60, width: 20, height: 510), MKRect<Double>(x: 0, y: 0, width: 10, height: 20)),
        (MKRect<Double>(x: -50, y: -40, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 20, height: 10)),
        (MKRect<Double>(x: -110, y: -120, width: 20, height: 710), MKRect<Double>(x: 0, y: 0, width: 80, height: 30)),

        (MKRect<Double>(x: 10, y: 60, width: 20, height: 410), MKRect<Double>(x: 10, y: 20, width: 200, height: 200)),
        (MKRect<Double>(x: -10, y: 60, width: 320, height: 10), MKRect<Double>(x: -10, y: 20, width: 100, height: 200)),
        (MKRect<Double>(x: -50, y: -40, width: 20, height: 10), MKRect<Double>(x: 10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: -110, y: -120, width: 420, height: 10), MKRect<Double>(x: -33, y: -20, width: 80, height: 300)),
    ])
    func leftTransform(_ args: (MKRect<Double>, MKRect<Double>)) throws {
        let (src, dest) = args

        let tr = MKAffineTransform.transform(from: src, to: dest, scaleMode: .left)

        #expect(
            src.applying(tr).left.isEqual(to: dest.left, tolerance: tolerance)
        )

        #expect(
            src.applying(tr).size.isEqual(to: src.size, tolerance: tolerance)
        )
    }

    @Test("Transform Top-Left", arguments: [
        (MKRect<Double>(x: 0, y: 0, width: 200, height: 100), MKRect<Double>(x: 0, y: 0, width: 200, height: 100)),
        (MKRect<Double>(x: 10, y: 20, width: 200, height: 100), MKRect<Double>(x: 10, y: 20, width: 200, height: 100)),
        (MKRect<Double>(x: -10, y: -20, width: 200, height: 100), MKRect<Double>(x: -10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: 10, y: -20, width: 200, height: 100), MKRect<Double>(x: 10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: -10, y: 20, width: 200, height: 100), MKRect<Double>(x: -10, y: 20, width: 200, height: 100)),

        (MKRect<Double>(x: 10, y: 60, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 20, height: 20)),
        (MKRect<Double>(x: -10, y: 60, width: 20, height: 510), MKRect<Double>(x: 0, y: 0, width: 10, height: 20)),
        (MKRect<Double>(x: -50, y: -40, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 20, height: 10)),
        (MKRect<Double>(x: -110, y: -120, width: 20, height: 710), MKRect<Double>(x: 0, y: 0, width: 80, height: 30)),

        (MKRect<Double>(x: 10, y: 60, width: 20, height: 410), MKRect<Double>(x: 10, y: 20, width: 200, height: 200)),
        (MKRect<Double>(x: -10, y: 60, width: 320, height: 10), MKRect<Double>(x: -10, y: 20, width: 100, height: 200)),
        (MKRect<Double>(x: -50, y: -40, width: 20, height: 10), MKRect<Double>(x: 10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: -110, y: -120, width: 420, height: 10), MKRect<Double>(x: -33, y: -20, width: 80, height: 300)),
    ])
    func topLeftTransform(_ args: (MKRect<Double>, MKRect<Double>)) throws {
        let (src, dest) = args

        let tr = MKAffineTransform.transform(from: src, to: dest, scaleMode: .topLeft)

        #expect(
            src.applying(tr).topLeft.isEqual(to: dest.topLeft, tolerance: tolerance)
        )

        #expect(
            src.applying(tr).size.isEqual(to: src.size, tolerance: tolerance)
        )
    }

    @Test("Transform Bottom-Left", arguments: [
        (MKRect<Double>(x: 0, y: 0, width: 200, height: 100), MKRect<Double>(x: 0, y: 0, width: 200, height: 100)),
        (MKRect<Double>(x: 10, y: 20, width: 200, height: 100), MKRect<Double>(x: 10, y: 20, width: 200, height: 100)),
        (MKRect<Double>(x: -10, y: -20, width: 200, height: 100), MKRect<Double>(x: -10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: 10, y: -20, width: 200, height: 100), MKRect<Double>(x: 10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: -10, y: 20, width: 200, height: 100), MKRect<Double>(x: -10, y: 20, width: 200, height: 100)),

        (MKRect<Double>(x: 10, y: 60, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 20, height: 20)),
        (MKRect<Double>(x: -10, y: 60, width: 20, height: 510), MKRect<Double>(x: 0, y: 0, width: 10, height: 20)),
        (MKRect<Double>(x: -50, y: -40, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 20, height: 10)),
        (MKRect<Double>(x: -110, y: -120, width: 20, height: 710), MKRect<Double>(x: 0, y: 0, width: 80, height: 30)),

        (MKRect<Double>(x: 10, y: 60, width: 20, height: 410), MKRect<Double>(x: 10, y: 20, width: 200, height: 200)),
        (MKRect<Double>(x: -10, y: 60, width: 320, height: 10), MKRect<Double>(x: -10, y: 20, width: 100, height: 200)),
        (MKRect<Double>(x: -50, y: -40, width: 20, height: 10), MKRect<Double>(x: 10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: -110, y: -120, width: 420, height: 10), MKRect<Double>(x: -33, y: -20, width: 80, height: 300)),
    ])
    func bottomLeftTransform(_ args: (MKRect<Double>, MKRect<Double>)) throws {
        let (src, dest) = args

        let tr = MKAffineTransform.transform(from: src, to: dest, scaleMode: .bottomLeft)

        #expect(
            src.applying(tr).bottomLeft.isEqual(to: dest.bottomLeft, tolerance: tolerance)
        )

        #expect(
            src.applying(tr).size.isEqual(to: src.size, tolerance: tolerance)
        )
    }

    @Test("Transform Top-Right", arguments: [
        (MKRect<Double>(x: 0, y: 0, width: 200, height: 100), MKRect<Double>(x: 0, y: 0, width: 200, height: 100)),
        (MKRect<Double>(x: 10, y: 20, width: 200, height: 100), MKRect<Double>(x: 10, y: 20, width: 200, height: 100)),
        (MKRect<Double>(x: -10, y: -20, width: 200, height: 100), MKRect<Double>(x: -10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: 10, y: -20, width: 200, height: 100), MKRect<Double>(x: 10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: -10, y: 20, width: 200, height: 100), MKRect<Double>(x: -10, y: 20, width: 200, height: 100)),

        (MKRect<Double>(x: 10, y: 60, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 20, height: 20)),
        (MKRect<Double>(x: -10, y: 60, width: 20, height: 510), MKRect<Double>(x: 0, y: 0, width: 10, height: 20)),
        (MKRect<Double>(x: -50, y: -40, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 20, height: 10)),
        (MKRect<Double>(x: -110, y: -120, width: 20, height: 710), MKRect<Double>(x: 0, y: 0, width: 80, height: 30)),

        (MKRect<Double>(x: 10, y: 60, width: 20, height: 410), MKRect<Double>(x: 10, y: 20, width: 200, height: 200)),
        (MKRect<Double>(x: -10, y: 60, width: 320, height: 10), MKRect<Double>(x: -10, y: 20, width: 100, height: 200)),
        (MKRect<Double>(x: -50, y: -40, width: 20, height: 10), MKRect<Double>(x: 10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: -110, y: -120, width: 420, height: 10), MKRect<Double>(x: -33, y: -20, width: 80, height: 300)),
    ])
    func topRightTransform(_ args: (MKRect<Double>, MKRect<Double>)) throws {
        let (src, dest) = args

        let tr = MKAffineTransform.transform(from: src, to: dest, scaleMode: .topRight)

        #expect(
            src.applying(tr).topRight.isEqual(to: dest.topRight, tolerance: tolerance)
        )

        #expect(
            src.applying(tr).size.isEqual(to: src.size, tolerance: tolerance)
        )
    }

    @Test("Transform Right", arguments: [
        (MKRect<Double>(x: 0, y: 0, width: 200, height: 100), MKRect<Double>(x: 0, y: 0, width: 200, height: 100)),
        (MKRect<Double>(x: 10, y: 20, width: 200, height: 100), MKRect<Double>(x: 10, y: 20, width: 200, height: 100)),
        (MKRect<Double>(x: -10, y: -20, width: 200, height: 100), MKRect<Double>(x: -10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: 10, y: -20, width: 200, height: 100), MKRect<Double>(x: 10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: -10, y: 20, width: 200, height: 100), MKRect<Double>(x: -10, y: 20, width: 200, height: 100)),

        (MKRect<Double>(x: 10, y: 60, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 20, height: 20)),
        (MKRect<Double>(x: -10, y: 60, width: 20, height: 510), MKRect<Double>(x: 0, y: 0, width: 10, height: 20)),
        (MKRect<Double>(x: -50, y: -40, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 20, height: 10)),
        (MKRect<Double>(x: -110, y: -120, width: 20, height: 710), MKRect<Double>(x: 0, y: 0, width: 80, height: 30)),

        (MKRect<Double>(x: 10, y: 60, width: 20, height: 410), MKRect<Double>(x: 10, y: 20, width: 200, height: 200)),
        (MKRect<Double>(x: -10, y: 60, width: 320, height: 10), MKRect<Double>(x: -10, y: 20, width: 100, height: 200)),
        (MKRect<Double>(x: -50, y: -40, width: 20, height: 10), MKRect<Double>(x: 10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: -110, y: -120, width: 420, height: 10), MKRect<Double>(x: -33, y: -20, width: 80, height: 300)),
    ])
    func rightTransform(_ args: (MKRect<Double>, MKRect<Double>)) throws {
        let (src, dest) = args

        let tr = MKAffineTransform.transform(from: src, to: dest, scaleMode: .right)

        #expect(
            src.applying(tr).right.isEqual(to: dest.right, tolerance: tolerance)
        )

        #expect(
            src.applying(tr).size.isEqual(to: src.size, tolerance: tolerance)
        )
    }

    @Test("Transform Bottom-Right", arguments: [
        (MKRect<Double>(x: 0, y: 0, width: 200, height: 100), MKRect<Double>(x: 0, y: 0, width: 200, height: 100)),
        (MKRect<Double>(x: 10, y: 20, width: 200, height: 100), MKRect<Double>(x: 10, y: 20, width: 200, height: 100)),
        (MKRect<Double>(x: -10, y: -20, width: 200, height: 100), MKRect<Double>(x: -10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: 10, y: -20, width: 200, height: 100), MKRect<Double>(x: 10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: -10, y: 20, width: 200, height: 100), MKRect<Double>(x: -10, y: 20, width: 200, height: 100)),

        (MKRect<Double>(x: 10, y: 60, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 20, height: 20)),
        (MKRect<Double>(x: -10, y: 60, width: 20, height: 510), MKRect<Double>(x: 0, y: 0, width: 10, height: 20)),
        (MKRect<Double>(x: -50, y: -40, width: 20, height: 10), MKRect<Double>(x: 0, y: 0, width: 20, height: 10)),
        (MKRect<Double>(x: -110, y: -120, width: 20, height: 710), MKRect<Double>(x: 0, y: 0, width: 80, height: 30)),

        (MKRect<Double>(x: 10, y: 60, width: 20, height: 410), MKRect<Double>(x: 10, y: 20, width: 200, height: 200)),
        (MKRect<Double>(x: -10, y: 60, width: 320, height: 10), MKRect<Double>(x: -10, y: 20, width: 100, height: 200)),
        (MKRect<Double>(x: -50, y: -40, width: 20, height: 10), MKRect<Double>(x: 10, y: -20, width: 200, height: 100)),
        (MKRect<Double>(x: -110, y: -120, width: 420, height: 10), MKRect<Double>(x: -33, y: -20, width: 80, height: 300)),
    ])
    func bottomRightTransform(_ args: (MKRect<Double>, MKRect<Double>)) throws {
        let (src, dest) = args

        let tr = MKAffineTransform.transform(from: src, to: dest, scaleMode: .bottomRight)

        #expect(
            src.applying(tr).bottomRight.isEqual(to: dest.bottomRight, tolerance: tolerance)
        )

        #expect(
            src.applying(tr).size.isEqual(to: src.size, tolerance: tolerance)
        )
    }
}
