//
//  Created by Vitali Kurlovich on 09.04.2026.
//

import Foundation
import MathKit
import Testing

#if canImport(CoreGraphics)
    import CoreGraphics
#endif

private let tolerance: Double = 0.0000000001
private let halfTolerance: Float32 = 0.0001
private let lowTolerance: Float16 = 0.1

extension MKRectTests {
    @Test("OffsetBy <Double>", arguments: [
        (MKRect<Double>.zero, MKVector<Double>.zero, MKRect<Double>.zero),
        (MKRect<Double>.null, MKVector<Double>(dx: 2, dy: 3), MKRect<Double>.null),
        (MKRect<Double>.infinite, MKVector<Double>(dx: 2, dy: 3), MKRect<Double>.infinite),

        (MKRect<Double>.zero, MKVector<Double>(dx: 2, dy: 3), MKRect<Double>(x: 2, y: 3)),

        (MKRect<Double>(x: -4, y: -6, width: 10, height: 20), MKVector<Double>(dx: 2, dy: 3), MKRect<Double>(x: -2, y: -3, width: 10, height: 20)),

    ])
    func offsetByDouble(_ args: (MKRect<Double>, MKVector<Double>, MKRect<Double>)) {
        let (rect, vec, expect) = args
        #expect(
            rect.offsetBy(vec).isEqual(to: expect, tolerance: tolerance)
        )

        let cg = CGRect(rect)
        let cgVec = CGVector(vec)

        #expect(
            MKRect<Double>(cg.offsetBy(dx: cgVec.dx, dy: cgVec.dy)).isEqual(to: expect, tolerance: tolerance)
        )
    }
}

extension MKRectTests {
    @Test("Union <Double>", arguments: [
        (MKRect<Double>.zero, MKRect<Double>.zero, MKRect<Double>.zero),

        (MKRect<Double>.zero, MKRect<Double>.null, MKRect<Double>.zero),
        (MKRect<Double>.null, MKRect<Double>.zero, MKRect<Double>.zero),

        (MKRect<Double>.null, MKRect<Double>.null, MKRect<Double>.null),

        (MKRect<Double>.infinite, MKRect<Double>.zero, MKRect<Double>.infinite),
        (MKRect<Double>.zero, MKRect<Double>.infinite, MKRect<Double>.infinite),

        (MKRect<Double>(x: -1, y: 2), MKRect<Double>.null, MKRect<Double>(x: -1, y: 2)),
        (MKRect<Double>.null, MKRect<Double>(x: -1, y: 2), MKRect<Double>(x: -1, y: 2)),

        (MKRect<Double>.infinite, MKRect<Double>(x: -1, y: 2), MKRect<Double>.infinite),
        (MKRect<Double>(x: -1, y: 2), MKRect<Double>.infinite, MKRect<Double>.infinite),

        (MKRect<Double>(x: -1, y: 2), MKRect<Double>.zero, MKRect<Double>(x: -1, y: 0, width: 1, height: 2)),
        (MKRect<Double>(x: -1, y: -2), MKRect<Double>(x: 2, y: 1), MKRect<Double>(x: -1, y: -2, width: 3, height: 3)),
    ])
    func unionDouble(_ args: (MKRect<Double>, MKRect<Double>, MKRect<Double>)) {
        let (first, second, expect) = args
        #expect(first.union(second).isEqual(to: expect, tolerance: tolerance))
        #expect(second.union(first).isEqual(to: expect, tolerance: tolerance))

        let cgFirst = CGRect(first)
        let cgSecond = CGRect(second)

        #expect(
            MKRect<Double>(cgFirst.union(cgSecond)).isEqual(to: expect, tolerance: tolerance)
        )
    }
}
