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

extension MKRectTests {
    @Test("Intersects <Double>", arguments: [
        (MKRect<Double>.zero, MKRect<Double>.zero, true),

        (MKRect<Double>.zero, MKRect<Double>.null, false),

        (MKRect<Double>.zero, MKRect<Double>.infinite, true),

        (MKRect<Double>.infinite, MKRect<Double>.infinite, true),

        (MKRect<Double>.null, MKRect<Double>.infinite, false),

        (MKRect<Double>(x: -1, y: -1, width: 2, height: 2), MKRect<Double>.zero, true),

        (MKRect<Double>(x: -1, y: -1, width: 2, height: 2), MKRect<Double>(width: 1, height: 1), true),
        (MKRect<Double>(x: -1, y: -1, width: 2, height: 2), MKRect<Double>(x: -0.5, y: -0.5, width: 1, height: 1), true),

        (MKRect<Double>(x: -1, y: -1, width: 2, height: 2), MKRect<Double>(x: 1, y: 1, width: 2, height: 2), true),

        (MKRect<Double>(x: 1, y: 1), MKRect<Double>.zero, false),

        (MKRect<Double>(x: -10, width: 20, height: 20), MKRect<Double>(x: 5, y: 5, width: 10, height: 10), true),

        (MKRect<Double>(x: -10, width: 20, height: 20), MKRect<Double>(x: 5, y: -11, width: 10, height: 10), false),
        (MKRect<Double>(x: -10, width: 20, height: 20), MKRect<Double>(x: 5, y: 21, width: 10, height: 10), false),

        (MKRect<Double>(x: -10, width: 20, height: 20), MKRect<Double>(x: 11, y: 5, width: 10, height: 10), false),

    ])
    func intersectsDouble(_ args: (MKRect<Double>, MKRect<Double>, Bool)) {
        let (first, second, expect) = args
        #expect(first.intersects(second) == expect)
        #expect(second.intersects(first) == expect)
    }
}

extension MKRectTests {
    @Test("intersection <Double>", arguments: [
        (MKRect<Double>.zero, MKRect<Double>.zero, MKRect<Double>.zero),

        (MKRect<Double>.zero, MKRect<Double>.null, nil),

        (MKRect<Double>.zero, MKRect<Double>.infinite, MKRect<Double>.zero),

        (MKRect<Double>.infinite, MKRect<Double>.infinite, MKRect<Double>.infinite),

        (MKRect<Double>.null, MKRect<Double>.infinite, nil),

        (MKRect<Double>(x: -1, y: -1, width: 2, height: 2), MKRect<Double>.zero, MKRect<Double>.zero),

        (MKRect<Double>(x: -1, y: -1, width: 2, height: 2), MKRect<Double>(width: 1, height: 1), MKRect<Double>(x: 0, y: 0, width: 1, height: 1)),
        (MKRect<Double>(x: -1, y: -1, width: 2, height: 2), MKRect<Double>(x: -0.5, y: -0.5, width: 1, height: 1), MKRect<Double>(x: -0.5, y: -0.5, width: 1, height: 1)),

        (MKRect<Double>(x: -1, y: -1, width: 2, height: 2), MKRect<Double>(x: 1, y: 1, width: 2, height: 2), MKRect<Double>(x: 1, y: 1)),

        (MKRect<Double>(x: 1, y: 1), MKRect<Double>.zero, nil),

        (MKRect<Double>(x: -10, width: 20, height: 20), MKRect<Double>(x: 5, y: -11, width: 10, height: 10), nil),
        (MKRect<Double>(x: -10, width: 20, height: 20), MKRect<Double>(x: 5, y: 21, width: 10, height: 10), nil),

        (MKRect<Double>(x: -10, width: 20, height: 20), MKRect<Double>(x: 11, y: 5, width: 10, height: 10), nil),

    ])
    func intersectionDouble(_ args: (MKRect<Double>, MKRect<Double>, MKRect<Double>?)) {
        let (first, second, expect) = args
        #expect(first.intersection(second) == expect)
        #expect(second.intersection(first) == expect)
    }
}
