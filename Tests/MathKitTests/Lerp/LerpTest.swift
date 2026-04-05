//
//  Created by Vitali Kurlovich on 24.12.25.
//

import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.0000001

@Suite("Lerp Test Cases")
struct LerpTests {
    @Test("Scalar")
    func scalar() {
        #expect(lerp(2.0, 16.0, t: 0.0).isEqual(to: 2.0, tolerance: tolerance))

        #expect(lerp(2.0, 16.0, t: 1.0).isEqual(to: 16.0, tolerance: tolerance))

        #expect(lerp(2.0, 16.0, t: 0.5).isEqual(to: 9.0, tolerance: tolerance))
    }

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

    @Test("MKPoint")
    func mkpoint() {
        #expect(lerp(MKPoint<Double>(x: 10, y: 20),
                     MKPoint<Double>(x: 60, y: 80), t: 0.0)
                .isEqual(to: MKPoint<Double>(x: 10, y: 20), tolerance: tolerance))

        #expect(lerp(MKPoint<Double>(x: 10, y: 20),
                     MKPoint<Double>(x: 60, y: 80), t: 1.0)
                .isEqual(to: MKPoint<Double>(x: 60, y: 80), tolerance: tolerance))

        #expect(lerp(MKPoint<Double>(x: 10, y: 20),
                     MKPoint<Double>(x: 60, y: 80), t: 0.5)
                .isEqual(to: MKPoint<Double>(x: 35, y: 50), tolerance: tolerance))
    }

    @Test("MKVector")
    func mkvector() {
        #expect(lerp(MKVector<Double>(dx: 10, dy: 20),
                     MKVector<Double>(dx: 60, dy: 80), t: 0.0)
                .isEqual(to: MKVector<Double>(dx: 10, dy: 20), tolerance: tolerance))

        #expect(lerp(MKVector<Double>(dx: 10, dy: 20),
                     MKVector<Double>(dx: 60, dy: 80), t: 1.0)
                .isEqual(to: MKVector<Double>(dx: 60, dy: 80), tolerance: tolerance))

        #expect(lerp(MKVector<Double>(dx: 10, dy: 20),
                     MKVector<Double>(dx: 60, dy: 80), t: 0.5)
                .isEqual(to: MKVector<Double>(dx: 35, dy: 50), tolerance: tolerance))
    }

    @Test("MKSize")
    func size() {
        #expect(lerp(MKSize<Double>(width: 10, height: 20),
                     MKSize<Double>(width: 60, height: 80), t: 0.0)
                .isEqual(to: MKSize(width: 10, height: 20), tolerance: tolerance))

        #expect(lerp(MKSize<Double>(width: 10, height: 20),
                     MKSize<Double>(width: 60, height: 80), t: 1.0)
                .isEqual(to: MKSize(width: 60, height: 80), tolerance: tolerance))

        #expect(lerp(MKSize<Double>(width: 10, height: 20),
                     MKSize<Double>(width: 60, height: 80), t: 0.5)
                .isEqual(to: MKSize(width: 35, height: 50), tolerance: tolerance))
    }

    @Test("MKAngle")
    func angle() {
        #expect(lerp(MKAngle.degrees(2.0), .degrees(16.0), t: 0.0).isEqual(to: .degrees(2.0), tolerance: tolerance))
        #expect(lerp(MKAngle.degrees(2.0), .degrees(16.0), t: 1.0).isEqual(to: .degrees(16.0), tolerance: tolerance))
        #expect(lerp(MKAngle.degrees(2.0), .degrees(16.0), t: 0.5).isEqual(to: .degrees(9.0), tolerance: tolerance))
    }

    @Test("MKRect")
    func rect() {
        let from = MKRect(origin: .init(x: 2.0, y: 4.0), size: .init(width: 10.0, height: 20.0))
        let to = MKRect(origin: .init(x: 12.0, y: 14.0), size: .init(width: 110.0, height: 220.0))

        let mid = MKRect(origin: .init(x: 7.0, y: 9.0), size: .init(width: 60.0, height: 120.0))

        #expect(lerp(from, to, t: 0.0).isEqual(to: from, tolerance: tolerance))
        #expect(lerp(from, to, t: 1.0).isEqual(to: to, tolerance: tolerance))
        #expect(lerp(from, to, t: 0.5).isEqual(to: mid, tolerance: tolerance))
    }

    @Test("MKAffineTransformComponents")
    func affineComponents() {
        let from = MKAffineTransformComponents(translation: .init(dx: -10, dy: -20),
                                               rotation: .degrees(10),
                                               scale: .init(width: 2.0, height: 3.0))

        let to = MKAffineTransformComponents(translation: .init(dx: 50, dy: 60), rotation: .degrees(110), scale: .init(width: 12.0, height: 23.0))

        let mid = MKAffineTransformComponents(translation: .init(dx: 20, dy: 20), rotation: .degrees(60), scale: .init(width: 7.0, height: 13.0))

        #expect(lerp(from, to, t: 0.0).isEqual(to: from, tolerance: tolerance))
        #expect(lerp(from, to, t: 1.0).isEqual(to: to, tolerance: tolerance))
        #expect(lerp(from, to, t: 0.5).isEqual(to: mid, tolerance: tolerance))
    }
}

#if canImport(CoreGraphics)
    import CoreGraphics

    extension LerpTests {
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

#endif // canImport(CoreGraphics)
