//
//  Created by Kurlovich Vitali on 9/2/26.
//

import CGMathKit
import CoreGraphics
import Foundation
import Testing

private let tolerance: Double = 0.0000001

struct LerpTests {}

extension LerpTests {
    @Test("CGPoint")
    func point() {
        #expect(lerp(CGPoint(x: 10, y: 20),
                     CGPoint(x: 60, y: 80), t: 0.0)
                .isEqual(to: CGPoint(x: 10, y: 20), tolerance: tolerance))

        #expect(lerp(CGPoint(x: 10, y: 20),
                     CGPoint(x: 60, y: 80), t: 1.0)
                .isEqual(to: CGPoint(x: 60, y: 80), tolerance: tolerance))

        #expect(lerp(CGPoint(x: 10, y: 20),
                     CGPoint(x: 60, y: 80), t: 0.5)
                .isEqual(to: CGPoint(x: 35, y: 50), tolerance: tolerance))
    }

    @Test("CGVector")
    func vector() {
        #expect(lerp(CGVector(dx: 10, dy: 20),
                     CGVector(dx: 60, dy: 80), t: 0.0)
                .isEqual(to: CGVector(dx: 10, dy: 20), tolerance: tolerance))

        #expect(lerp(CGVector(dx: 10, dy: 20),
                     CGVector(dx: 60, dy: 80), t: 1.0)
                .isEqual(to: CGVector(dx: 60, dy: 80), tolerance: tolerance))

        #expect(lerp(CGVector(dx: 10, dy: 20),
                     CGVector(dx: 60, dy: 80), t: 0.5)
                .isEqual(to: CGVector(dx: 35, dy: 50), tolerance: tolerance))
    }
}
