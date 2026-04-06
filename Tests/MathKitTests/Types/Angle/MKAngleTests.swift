//
//  Created by Vitali Kurlovich on 02.04.2026.
//

import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.00000001

@Suite("MKAngle")
struct MKAngleTests {}

extension MKAngleTests {
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
}

extension MKAngleTests {
    @Test("Negate", arguments: [
        (MKAngle<Double>.zero, MKAngle<Double>.zero),
        (MKAngle<Double>.radians(.pi / 2), MKAngle<Double>.radians(-.pi / 2)),
    ])
    func negateDouble(_ args: (MKAngle<Double>, MKAngle<Double>)) throws {
        let (angle, expect) = args

        #expect((-angle).isEqual(to: expect, tolerance: tolerance))

        var ma = angle
        ma.negate()

        #expect(ma.isEqual(to: expect, tolerance: tolerance))
    }
}

extension MKAngleTests {
    @Test("Addittion", arguments: [
        (MKAngle<Double>.zero, MKAngle<Double>.zero, MKAngle<Double>.zero),
        (MKAngle<Double>.zero, MKAngle<Double>.degrees(20), MKAngle<Double>.degrees(20)),
        (MKAngle<Double>.degrees(120), MKAngle<Double>.degrees(20), MKAngle<Double>.degrees(140)),
        (MKAngle<Double>.degrees(120), MKAngle<Double>.degrees(-20), MKAngle<Double>.degrees(100)),

    ])
    func addDouble(_ args: (MKAngle<Double>, MKAngle<Double>, MKAngle<Double>)) throws {
        let (angle, add, expect) = args

        #expect((angle + add).isEqual(to: expect, tolerance: tolerance))

        var ma = angle
        ma += add
        #expect(ma.isEqual(to: expect, tolerance: tolerance))
    }

    @Test("Substraction", arguments: [
        (MKAngle<Double>.zero, MKAngle<Double>.zero, MKAngle<Double>.zero),
        (MKAngle<Double>.zero, MKAngle<Double>.degrees(20), MKAngle<Double>.degrees(-20)),
        (MKAngle<Double>.degrees(120), MKAngle<Double>.degrees(20), MKAngle<Double>.degrees(100)),
        (MKAngle<Double>.degrees(120), MKAngle<Double>.degrees(-20), MKAngle<Double>.degrees(140)),

    ])
    func subDouble(_ args: (MKAngle<Double>, MKAngle<Double>, MKAngle<Double>)) throws {
        let (angle, add, expect) = args

        #expect((angle - add).isEqual(to: expect, tolerance: tolerance))

        var ma = angle
        ma -= add
        #expect(ma.isEqual(to: expect, tolerance: tolerance))
    }
}
