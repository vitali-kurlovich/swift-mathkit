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
    @Test("Containts <CGFloat>", arguments: [
        (MKRect<CGFloat>.zero, MKPoint<CGFloat>.zero, false),

        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 0), MKPoint<CGFloat>(x: 10, y: 20), false),

        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 0), MKPoint<CGFloat>(x: 15, y: 20), false),
        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 0), MKPoint<CGFloat>(x: 20, y: 20), false),

        (MKRect<CGFloat>(x: 10, y: 20, width: 0, height: 10), MKPoint<CGFloat>(x: 10, y: 20), false),
        (MKRect<CGFloat>(x: 10, y: 20, width: 0, height: 10), MKPoint<CGFloat>(x: 10, y: 25), false),
        (MKRect<CGFloat>(x: 10, y: 20, width: 0, height: 10), MKPoint<CGFloat>(x: 10, y: 30), false),

        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 0), MKPoint<CGFloat>(x: 10, y: 20), false),
        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 0), MKPoint<CGFloat>(x: 15, y: 20), false),
        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 0), MKPoint<CGFloat>(x: 20, y: 20), false),

        // ---

        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKPoint<CGFloat>(x: 10, y: 20), true),
        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKPoint<CGFloat>(x: 10, y: 25), true),
        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKPoint<CGFloat>(x: 10, y: 30), true),

        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKPoint<CGFloat>(x: 15, y: 20), true),
        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKPoint<CGFloat>(x: 15, y: 25), true),
        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKPoint<CGFloat>(x: 15, y: 30), true),

        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKPoint<CGFloat>(x: 20, y: 20), true),
        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKPoint<CGFloat>(x: 20, y: 25), true),
        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKPoint<CGFloat>(x: 20, y: 30), true),

        // ---

        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKPoint<CGFloat>(x: 0, y: 20), false),
        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKPoint<CGFloat>(x: 0, y: 25), false),
        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKPoint<CGFloat>(x: 0, y: 30), false),

        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKPoint<CGFloat>(x: 30, y: 20), false),
        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKPoint<CGFloat>(x: 30, y: 25), false),
        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKPoint<CGFloat>(x: 30, y: 30), false),

        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKPoint<CGFloat>(x: 10, y: 10), false),
        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKPoint<CGFloat>(x: 15, y: 10), false),
        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKPoint<CGFloat>(x: 20, y: 10), false),

        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKPoint<CGFloat>(x: 10, y: 40), false),
        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKPoint<CGFloat>(x: 15, y: 40), false),
        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKPoint<CGFloat>(x: 20, y: 40), false),

        // ---

        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10).topLeft, true),
        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10).top, true),
        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10).topRight, true),

        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10).left, true),
        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10).center, true),
        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10).right, true),

        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10).bottomLeft, true),
        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10).bottom, true),
        (MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10), MKRect<CGFloat>(x: 10, y: 20, width: 10, height: 10).bottomRight, true),

    ])
    func containts(_ args: (MKRect<CGFloat>, MKPoint<CGFloat>, Bool)) {
        let (rect, point, expect) = args
        #expect(rect.contains(point) == expect)
    }
}
