//
//  Created by Vitali Kurlovich on 13.04.2026.
//

import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.00000000000001
private let halfTolerance: Float32 = 0.00001
private let lowTolerance: Float16 = 0.1

@Suite("MKPivot")
struct MKPivotTests {}

extension MKPivotTests {
    @Test("MKPivot of MKAffineTransform", arguments: [
        (MKAffineTransform<Double>.identity, MKPivot<Double>.zero),
    ])
    func affinePivotDouble(_ args: (MKAffineTransform<Double>, MKPivot<Double>)) {
        let (tr, expect) = args

        #expect(
            tr.pivot.isEqual(to: expect, tolerance: tolerance)
        )
    }
}
