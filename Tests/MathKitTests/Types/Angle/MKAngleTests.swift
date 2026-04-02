//
//  Created by Vitali Kurlovich on 02.04.2026.
//

import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.00000001

@Suite("MKAngle")
struct MKAngleTests {
    @Test("Zero")
    func zero() {
        let angle = MKAngle<Double>.zero

        #expect(angle.radians == 0)
        #expect(angle.degrees == 0)
    }

    @Test("Identity")
    func identity() throws {
        let angle = MKAngle<Double>.identity

        #expect(angle.radians == 2 * .pi)
        #expect(angle.degrees.isEqual(to: 360.0, tolerance: tolerance))
    }

    @Test("Addittion")
    func add() throws {
        var angle = MKAngle<Double>.degrees(180)

        angle += .degrees(20)

        #expect(angle.degrees.isEqual(to: 200.0, tolerance: tolerance))
    }

    @Test("Substraction")
    func sub() throws {
        var angle = MKAngle<Double>.degrees(180)

        angle -= .degrees(20)

        #expect(angle.degrees.isEqual(to: 160.0, tolerance: tolerance))
    }
}
