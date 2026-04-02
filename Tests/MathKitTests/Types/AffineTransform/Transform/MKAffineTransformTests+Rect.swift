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
    }

    @Test("Transform fill", arguments: [
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
    }
}
