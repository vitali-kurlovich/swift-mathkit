//
//  Created by Vitali Kurlovich on 02.04.2026.
//

import MathKit
import Testing

private let tolerance: Double = 0.00000001

extension MKAffineTransformTests {
    @Test("Transform center", arguments: [
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0)
        ),

        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 20.0, y: -10.0, width: 100.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -55.0, y: -85.0, width: 250.0, height: 250.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 20.0, y: -85.0, width: 100.0, height: 250.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -55.0, y: -10.0, width: 250.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 85.0, y: 20.0, width: 100.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 60.0, y: -5.0, width: 150.0, height: 150.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 85.0, y: -5.0, width: 100.0, height: 150.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 60.0, y: 20.0, width: 150.0, height: 100.0)
        ),
    ])
    func center(_ args: (MKRect<Double>, MKRect<Double>, MKRect<Double>)) {
        let (src, dest, exp) = args

        let tr = MKAffineTransform.transform(for: src, center: dest)

        #expect(tr.transform(src).isEqual(to: exp, tolerance: tolerance))

        #expect(
            src.applying(tr).isEqual(to: exp, tolerance: tolerance)
        )
    }

    @Test("Transform left", arguments: [
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -85.0, width: 250.0, height: 250.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -85.0, width: 100.0, height: 250.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 250.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: -5.0, width: 150.0, height: 150.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: -5.0, width: 100.0, height: 150.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 150.0, height: 100.0)
        ),

    ])
    func left(_ args: (MKRect<Double>, MKRect<Double>, MKRect<Double>)) {
        let (src, dest, exp) = args

        let tr = MKAffineTransform.transform(for: src, left: dest)

        #expect(tr.transform(src).isEqual(to: exp, tolerance: tolerance))

        #expect(
            src.applying(tr).isEqual(to: exp, tolerance: tolerance)
        )
    }

    @Test("Transform right", arguments: [
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 45.0, y: -10.0, width: 100.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -105.0, y: -85.0, width: 250.0, height: 250.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 45.0, y: -85.0, width: 100.0, height: 250.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -105.0, y: -10.0, width: 250.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 160.0, y: 20.0, width: 100.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 110.0, y: -5.0, width: 150.0, height: 150.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 160.0, y: -5.0, width: 100.0, height: 150.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 110.0, y: 20.0, width: 150.0, height: 100.0)
        ),

    ])
    func right(_ args: (MKRect<Double>, MKRect<Double>, MKRect<Double>)) {
        let (src, dest, exp) = args

        let tr = MKAffineTransform.transform(for: src, right: dest)

        #expect(tr.transform(src).isEqual(to: exp, tolerance: tolerance))

        #expect(
            src.applying(tr).isEqual(to: exp, tolerance: tolerance)
        )
    }
}

extension MKAffineTransformTests {
    @Test("Transform top", arguments: [
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 20.0, y: -10.0, width: 100.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -55.0, y: -10.0, width: 250.0, height: 250.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 20.0, y: -10.0, width: 100.0, height: 250.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -55.0, y: -10.0, width: 250.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 85.0, y: 20.0, width: 100.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 60.0, y: 20.0, width: 150.0, height: 150.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 85.0, y: 20.0, width: 100.0, height: 150.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 60.0, y: 20.0, width: 150.0, height: 100.0)
        ),
    ])
    func top(_ args: (MKRect<Double>, MKRect<Double>, MKRect<Double>)) {
        let (src, dest, exp) = args

        let tr = MKAffineTransform.transform(for: src, top: dest)

        #expect(tr.transform(src).isEqual(to: exp, tolerance: tolerance))

        #expect(
            src.applying(tr).isEqual(to: exp, tolerance: tolerance)
        )
    }

    @Test("Transform topLeft", arguments: [
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 250.0, height: 250.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 250.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 250.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 150.0, height: 150.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 150.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 150.0, height: 100.0)
        ),
    ])
    func topLeft(_ args: (MKRect<Double>, MKRect<Double>, MKRect<Double>)) {
        let (src, dest, exp) = args

        let tr = MKAffineTransform.transform(for: src, topLeft: dest)

        #expect(tr.transform(src).isEqual(to: exp, tolerance: tolerance))

        #expect(
            src.applying(tr).isEqual(to: exp, tolerance: tolerance)
        )
    }

    @Test("Transform topRight", arguments: [
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 45.0, y: -10.0, width: 100.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -105.0, y: -10.0, width: 250.0, height: 250.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 45.0, y: -10.0, width: 100.0, height: 250.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -105.0, y: -10.0, width: 250.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 160.0, y: 20.0, width: 100.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 110.0, y: 20.0, width: 150.0, height: 150.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 160.0, y: 20.0, width: 100.0, height: 150.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 110.0, y: 20.0, width: 150.0, height: 100.0)
        ),

    ])
    func topRight(_ args: (MKRect<Double>, MKRect<Double>, MKRect<Double>)) {
        let (src, dest, exp) = args

        let tr = MKAffineTransform.transform(for: src, topRight: dest)

        #expect(tr.transform(src).isEqual(to: exp, tolerance: tolerance))

        #expect(
            src.applying(tr).isEqual(to: exp, tolerance: tolerance)
        )
    }
}

extension MKAffineTransformTests {
    @Test("Transform bottom", arguments: [
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 20.0, y: -10.0, width: 100.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -55.0, y: -160.0, width: 250.0, height: 250.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 20.0, y: -160.0, width: 100.0, height: 250.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -55.0, y: -10.0, width: 250.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 85.0, y: 20.0, width: 100.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 60.0, y: -30.0, width: 150.0, height: 150.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 85.0, y: -30.0, width: 100.0, height: 150.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 60.0, y: 20.0, width: 150.0, height: 100.0)
        ),
    ])
    func bottom(_ args: (MKRect<Double>, MKRect<Double>, MKRect<Double>)) {
        let (src, dest, exp) = args

        let tr = MKAffineTransform.transform(for: src, bottom: dest)

        #expect(tr.transform(src).isEqual(to: exp, tolerance: tolerance))

        #expect(
            src.applying(tr).isEqual(to: exp, tolerance: tolerance)
        )
    }

    @Test("Transform bottom-left", arguments: [
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -160.0, width: 250.0, height: 250.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -160.0, width: 100.0, height: 250.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 250.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: -30.0, width: 150.0, height: 150.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: -30.0, width: 100.0, height: 150.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 150.0, height: 100.0)
        ),
    ])
    func bottomLeft(_ args: (MKRect<Double>, MKRect<Double>, MKRect<Double>)) {
        let (src, dest, exp) = args

        let tr = MKAffineTransform.transform(for: src, bottomLeft: dest)

        #expect(tr.transform(src).isEqual(to: exp, tolerance: tolerance))

        #expect(
            src.applying(tr).isEqual(to: exp, tolerance: tolerance)
        )
    }

    @Test("Transform bottom-right", arguments: [
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 45.0, y: -10.0, width: 100.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -105.0, y: -160.0, width: 250.0, height: 250.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 45.0, y: -160.0, width: 100.0, height: 250.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -105.0, y: -10.0, width: 250.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 160.0, y: 20.0, width: 100.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 110.0, y: -30.0, width: 150.0, height: 150.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 160.0, y: -30.0, width: 100.0, height: 150.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 110.0, y: 20.0, width: 150.0, height: 100.0)
        ),

    ])
    func bottomRight(_ args: (MKRect<Double>, MKRect<Double>, MKRect<Double>)) {
        let (src, dest, exp) = args

        let tr = MKAffineTransform.transform(for: src, bottomRight: dest)

        #expect(tr.transform(src).isEqual(to: exp, tolerance: tolerance))

        #expect(
            src.applying(tr).isEqual(to: exp, tolerance: tolerance)
        )
    }
}

extension MKAffineTransformTests {
    @Test("Transform fill", arguments: [
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 10, y: 20, width: 250, height: 100)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20, width: 250.0, height: 100)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 10, y: 20.0, width: 250, height: 100.0)
        ),

    ])
    func fill(_ args: (MKRect<Double>, MKRect<Double>, MKRect<Double>)) {
        let (src, dest, exp) = args

        let tr = MKAffineTransform.transform(for: src, fill: dest)

        #expect(tr.transform(src).isEqual(to: exp, tolerance: tolerance))

        #expect(
            src.applying(tr).isEqual(to: exp, tolerance: tolerance)
        )
    }

    @Test("Transform aspect-fit", arguments: [
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 20.0, y: -10.0, width: 100.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 20.0, y: -10.0, width: 100.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 50.0, y: -10.0, width: 40.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: 10.0, width: 150.0, height: 60.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 85.0, y: 20.0, width: 100.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 85, y: 20, width: 100, height: 100)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 101.6666666666, y: 20, width: 66.666666666, height: 100)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 60.0, y: 20.0, width: 150.0, height: 100.0)
        ),

    ])
    func aspectFit(_ args: (MKRect<Double>, MKRect<Double>, MKRect<Double>)) {
        let (src, dest, exp) = args

        let tr = MKAffineTransform.transform(for: src, aspectFit: dest)

        #expect(tr.transform(src).isEqual(to: exp, tolerance: tolerance))

        #expect(
            src.applying(tr).isEqual(to: exp, tolerance: tolerance)
        )
    }

    @Test("Transform aspect-fill", arguments: [
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 200.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -35.0, width: 150.0, height: 150.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -35.0, width: 150.0, height: 150.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 100.0, height: 250.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -147.5, width: 150.0, height: 375.0)
        ),
        (
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: -55.0, y: -10.0, width: 250.0, height: 100.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: -55.0, width: 250.0, height: 250.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 10, y: -55, width: 250, height: 250)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 100.0, height: 150.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: -117.5, width: 250.0, height: 375.0)
        ),
        (
            MKRect<Double>(x: -5.0, y: -10.0, width: 150.0, height: 100.0),
            MKRect<Double>(x: 10.0, y: 20.0, width: 250.0, height: 100.0),
            MKRect<Double>(x: 10, y: -13.33333333333, width: 250, height: 166.66666666666)
        ),

    ])
    func aspectFill(_ args: (MKRect<Double>, MKRect<Double>, MKRect<Double>)) {
        let (src, dest, exp) = args

        let tr = MKAffineTransform.transform(for: src, aspectFill: dest)

        #expect(tr.transform(src).isEqual(to: exp, tolerance: tolerance))

        #expect(
            src.applying(tr).isEqual(to: exp, tolerance: tolerance)
        )
    }
}
