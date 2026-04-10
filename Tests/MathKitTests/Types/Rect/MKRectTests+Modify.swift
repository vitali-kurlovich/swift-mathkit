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
        #if canImport(CoreGraphics)
            let cg = CGRect(rect)
            let cgVec = CGVector(vec)

            #expect(
                MKRect<Double>(cg.offsetBy(dx: cgVec.dx, dy: cgVec.dy)).isEqual(to: expect, tolerance: tolerance)
            )
        #endif
    }

    @Test("inset <Double>", arguments: [
        (MKRect<Double>.zero, MKEdgeInsets<Double>.zero, MKRect<Double>.zero),

        (MKRect<Double>.zero, MKEdgeInsets<Double>(top: 1), nil),
        (MKRect<Double>.zero, MKEdgeInsets<Double>(left: 1), nil),
        (MKRect<Double>.zero, MKEdgeInsets<Double>(right: 1), nil),
        (MKRect<Double>.zero, MKEdgeInsets<Double>(bottom: 1), nil),

        (MKRect<Double>.null, MKEdgeInsets<Double>.zero, nil),
        (MKRect<Double>.infinite, MKEdgeInsets<Double>.zero, MKRect<Double>.infinite),
        (MKRect<Double>.infinite, MKEdgeInsets<Double>(top: 1_000_000, left: 1_000_000, bottom: 1_000_000, right: 1_000_000), MKRect<Double>.infinite),

        (MKRect<Double>(x: -1, y: -1, width: 2, height: 2), MKEdgeInsets<Double>(top: 1, left: 1, bottom: 1, right: 1), MKRect<Double>.zero),

        (MKRect<Double>(x: -1, y: -1, width: 2, height: 2), MKEdgeInsets<Double>(top: 1, left: 1, bottom: 1, right: 1), MKRect<Double>.zero),

        (MKRect<Double>(x: -2, y: -2, width: 4, height: 4), MKEdgeInsets<Double>(top: 1, left: 1, bottom: 1, right: 1), MKRect<Double>(x: -1, y: -1, width: 2, height: 2)),

        (MKRect<Double>(x: -2, y: -2, width: 4, height: 4), MKEdgeInsets<Double>(top: 1), MKRect<Double>(x: -2, y: -1, width: 4, height: 3)),

        (MKRect<Double>(x: -2, y: -2, width: 4, height: 4), MKEdgeInsets<Double>(left: 1), MKRect<Double>(x: -1, y: -2, width: 3, height: 4)),

        (MKRect<Double>(x: -2, y: -2, width: 4, height: 4), MKEdgeInsets<Double>(bottom: 1), MKRect<Double>(x: -2, y: -2, width: 4, height: 3)),

        (MKRect<Double>(x: -2, y: -2, width: 4, height: 4), MKEdgeInsets<Double>(right: 1), MKRect<Double>(x: -2, y: -2, width: 3, height: 4)),

        (MKRect<Double>(x: -2, y: -2, width: 4, height: 4), MKEdgeInsets<Double>(left: 2, right: 2), MKRect<Double>(x: 0, y: -2, width: 0, height: 4)),
        (MKRect<Double>(x: -2, y: -2, width: 4, height: 4), MKEdgeInsets<Double>(left: 3, right: 2), nil),

        (MKRect<Double>(x: -2, y: -2, width: 4, height: 4), MKEdgeInsets<Double>(top: 2, bottom: 2), MKRect<Double>(x: -2, y: 0, width: 4, height: 0)),

        (MKRect<Double>(x: -2, y: -2, width: 4, height: 4), MKEdgeInsets<Double>(top: 3, bottom: 2), nil),

    ])
    func insetDouble(_ args: (MKRect<Double>, MKEdgeInsets<Double>, MKRect<Double>?)) throws {
        let (rect, inset, expect) = args

        if let expect {
            let result = try #require(rect.inset(by: inset))

            #expect(
                result.isEqual(to: expect, tolerance: tolerance)
            )

            if inset.left == inset.right, inset.top == inset.bottom {
                let result = try #require(rect.insetBy(dx: inset.left, dy: inset.top))

                #expect(
                    result.isEqual(to: expect, tolerance: tolerance)
                )
            }

        } else {
            #expect(
                rect.inset(by: inset) == nil
            )

            if inset.left == inset.right, inset.top == inset.bottom {
                #expect(
                    rect.insetBy(dx: inset.left, dy: inset.top) == nil
                )
            }
        }
    }
}
