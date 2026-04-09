//
//  Created by Vitali Kurlovich on 10.01.26.
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

@Suite("MKPoint")
struct MKRectTests {}

extension MKRectTests {
    @Test("Constructor <Double>")
    func constructorDouble() throws {
        let rect = MKRect<Double>(x: 1, y: 2, width: 3, height: 4)
        let cg = CGRect(rect)
        let conv = MKRect<Double>(cg)

        #expect(rect.isEqual(to: conv, tolerance: tolerance))
    }

    @Test("Constructor <CGFloat>")
    func constructorCGFloat() throws {
        let rect = MKRect<CGFloat>(x: 1, y: 2, width: 3, height: 4)
        let cg = CGRect(rect)
        let conv = MKRect<CGFloat>(cg)

        #expect(rect.isEqual(to: conv, tolerance: tolerance))
    }

    @Test("Constructor <Float>")
    func constructorFloat() throws {
        let rect = MKRect<Float>(x: 1, y: 2, width: 3, height: 4)
        let cg = CGRect(rect)
        let conv = MKRect<Float>(cg)

        #expect(rect.isEqual(to: conv, tolerance: halfTolerance))
    }

    @Test("Constructor <Float16>")
    func constructorFloat16() throws {
        let rect = MKRect<Float16>(x: 1, y: 2, width: 3, height: 4)
        let cg = CGRect(rect)
        let conv = MKRect<Float16>(cg)

        #expect(rect.isEqual(to: conv, tolerance: lowTolerance))
    }
}

extension MKRectTests {
    @Test("Zero")
    func zero() {
        #expect(MKRect<Double>.zero.origin == .zero)
        #expect(MKRect<Double>.zero.size == .zero)
    }

    @Test("Identity")
    func identity() throws {
        #expect(MKRect<Double>.zero.origin == .zero)
        #expect(MKRect<Double>.zero.size == .zero)
    }
}

extension MKRectTests {
    @Test("isEmpty", arguments: [
        (MKRect<Double>.zero, true),
        (MKRect<Double>(x: 3, y: 2, width: 0, height: 12), true),
        (MKRect<Double>(x: 3, y: 2, width: 12, height: 0), true),

        (MKRect<Double>(x: 3, y: 2, width: 0, height: 0), true),

        (MKRect<Double>(width: 1, height: 1), false),
        (MKRect<Double>(x: -1, y: -1, width: 1, height: 1), false),
    ])
    func isEmpty(_ args: (MKRect<Double>, Bool)) {
        let (rect, expect) = args

        #expect(rect.isEmpty == expect)
    }

    @Test("isInfinite", arguments: [
        (MKRect<Double>.infinite, true),
        (MKRect<Double>(x: 3, y: 2, width: MKRect<Double>.infinite.width, height: MKRect<Double>.infinite.height), true),
        (MKRect<Double>.null, false),
        (MKRect<Double>(x: -10_000_000_000_000, y: -10_000_000_000_000, width: 1_000_000_000_000_000, height: 1_000_000_000_000_000), false),
    ])
    func isInfinite(_ args: (MKRect<Double>, Bool)) {
        let (rect, expect) = args

        #expect(rect.isInfinite == expect)
    }

    @Test("isNull", arguments: [
        (MKRect<Double>.null, true),
        (MKRect<Double>(x: Double.infinity, y: Double.infinity, width: Double.infinity, height: Double.infinity), true),
        (MKRect<Double>(x: Double.infinity, y: Double.infinity, width: 10, height: 10), true),
        (MKRect<Double>.infinite, false),

        (MKRect<Double>(x: -10_000_000_000_000, y: -10_000_000_000_000, width: 1_000_000_000_000_000, height: 1_000_000_000_000_000), false),
        (MKRect<Double>(x: 10_000_000_000_000, y: 10_000_000_000_000, width: 0, height: 0), false),
    ])
    func isNull(_ args: (MKRect<Double>, Bool)) {
        let (rect, expect) = args

        #expect(rect.isNull == expect)
    }
}

extension MKRectTests {
    @Test("aspectRatio",
          arguments: [
              (MKRect<Double>.identity, 1.0),
              (MKRect<Double>(x: 20, y: 10, width: 200, height: 100), 2.0),
              (MKRect<Double>(x: 20, y: 10, width: 200, height: 400), 0.5),

          ])
    func aspectRatio(_ args: (MKRect<Double>, Double)) throws {
        let (rect, expect) = args
        #expect(rect.aspectRatio.isEqual(to: expect, tolerance: tolerance))
    }

    @Test("Min/Max")
    func minmax() {
        let rect = MKRect<CGFloat>(x: 10, y: 20, width: 30, height: 40)
        let expected = CGRect(x: 10, y: 20, width: 30, height: 40)

        #expect(CGRect(rect) == expected)
        #expect(MKRect<CGFloat>(expected) == rect)

        #expect(rect.x == expected.origin.x)
        #expect(rect.y == expected.origin.y)

        #expect(rect.width == expected.size.width)
        #expect(rect.height == expected.size.height)

        #expect(rect.midX == rect.center.x)
        #expect(rect.midY == rect.center.y)

        #expect(rect.minX == expected.minX)
        #expect(rect.midX == expected.midX)
        #expect(rect.maxX == expected.maxX)

        #expect(rect.minY == expected.minY)
        #expect(rect.midY == expected.midY)
        #expect(rect.maxY == expected.maxY)
    }
}

extension MKRectTests {
    @Test("Top-Center <Double>", arguments: [
        (MKRect<Double>(x: 0, y: 0, width: 30, height: 40), MKPoint<Double>(x: 15, y: 0)),
        (MKRect<Double>(x: 10, y: 20, width: 30, height: 40), MKPoint<Double>(x: 25, y: 20)),
        (MKRect<Double>(x: -10, y: -40, width: 30, height: 40), MKPoint<Double>(x: 5, y: -40)),
    ])
    func topCenter(args: (MKRect<Double>, MKPoint<Double>)) {
        let (rect, point) = args

        #expect(rect.top.isEqual(to: point, tolerance: tolerance))
    }

    @Test("Center <Double>", arguments: [
        (MKRect<Double>(x: 0, y: 0, width: 30, height: 40), MKPoint<Double>(x: 15, y: 20)),
        (MKRect<Double>(x: 10, y: 20, width: 30, height: 40), MKPoint<Double>(x: 25, y: 40)),
        (MKRect<Double>(x: -10, y: -40, width: 30, height: 40), MKPoint<Double>(x: 5, y: -20)),
    ])
    func center(args: (MKRect<Double>, MKPoint<Double>)) {
        let (rect, point) = args

        #expect(rect.center.isEqual(to: point, tolerance: tolerance))
    }

    @Test("Bottom-Center <Double>", arguments: [
        (MKRect<Double>(x: 0, y: 0, width: 30, height: 40), MKPoint<Double>(x: 15, y: 40)),
        (MKRect<Double>(x: 10, y: 20, width: 30, height: 40), MKPoint<Double>(x: 25, y: 60)),
        (MKRect<Double>(x: -10, y: -40, width: 30, height: 40), MKPoint<Double>(x: 5, y: 0)),
    ])
    func nottomCenter(args: (MKRect<Double>, MKPoint<Double>)) {
        let (rect, point) = args

        #expect(rect.bottom.isEqual(to: point, tolerance: tolerance))
    }
}

extension MKRectTests {
    @Test("Top-Left <Double>", arguments: [
        (MKRect<Double>(x: 0, y: 0, width: 30, height: 40), MKPoint<Double>(x: 0, y: 0)),
        (MKRect<Double>(x: 10, y: 20, width: 30, height: 40), MKPoint<Double>(x: 10, y: 20)),
        (MKRect<Double>(x: -10, y: -40, width: 30, height: 40), MKPoint<Double>(x: -10, y: -40)),
    ])
    func topLeft(args: (MKRect<Double>, MKPoint<Double>)) {
        let (rect, point) = args

        #expect(rect.topLeft.isEqual(to: point, tolerance: tolerance))
    }

    @Test("Left <Double>", arguments: [
        (MKRect<Double>(x: 0, y: 0, width: 30, height: 40), MKPoint<Double>(x: 0, y: 20)),
        (MKRect<Double>(x: 10, y: 20, width: 30, height: 40), MKPoint<Double>(x: 10, y: 40)),
        (MKRect<Double>(x: -10, y: -40, width: 30, height: 40), MKPoint<Double>(x: -10, y: -20)),
    ])
    func left(args: (MKRect<Double>, MKPoint<Double>)) {
        let (rect, point) = args

        #expect(rect.left.isEqual(to: point, tolerance: tolerance))
    }

    @Test("Bottom-Left <Double>", arguments: [
        (MKRect<Double>(x: 0, y: 0, width: 30, height: 40), MKPoint<Double>(x: 0, y: 40)),
        (MKRect<Double>(x: 10, y: 20, width: 30, height: 40), MKPoint<Double>(x: 10, y: 60)),
        (MKRect<Double>(x: -10, y: -40, width: 30, height: 40), MKPoint<Double>(x: -10, y: 0)),
    ])
    func bottomLeft(args: (MKRect<Double>, MKPoint<Double>)) {
        let (rect, point) = args

        #expect(rect.bottomLeft.isEqual(to: point, tolerance: tolerance))
    }
}

extension MKRectTests {
    @Test("Top-Right <Double>", arguments: [
        (MKRect<Double>(x: 0, y: 0, width: 30, height: 40), MKPoint<Double>(x: 30, y: 0)),
        (MKRect<Double>(x: 10, y: 20, width: 30, height: 40), MKPoint<Double>(x: 40, y: 20)),
        (MKRect<Double>(x: -10, y: -40, width: 30, height: 40), MKPoint<Double>(x: 20, y: -40)),
    ])
    func topRight(args: (MKRect<Double>, MKPoint<Double>)) {
        let (rect, point) = args

        #expect(rect.topRight.isEqual(to: point, tolerance: tolerance))
    }

    @Test("Right <Double>", arguments: [
        (MKRect<Double>(x: 0, y: 0, width: 30, height: 40), MKPoint<Double>(x: 30, y: 20)),
        (MKRect<Double>(x: 10, y: 20, width: 30, height: 40), MKPoint<Double>(x: 40, y: 40)),
        (MKRect<Double>(x: -10, y: -40, width: 30, height: 40), MKPoint<Double>(x: 20, y: -20)),
    ])
    func right(args: (MKRect<Double>, MKPoint<Double>)) {
        let (rect, point) = args

        #expect(rect.right.isEqual(to: point, tolerance: tolerance))
    }

    @Test("Bottom-Right <Double>", arguments: [
        (MKRect<Double>(x: 0, y: 0, width: 30, height: 40), MKPoint<Double>(x: 30, y: 40)),
        (MKRect<Double>(x: 10, y: 20, width: 30, height: 40), MKPoint<Double>(x: 40, y: 60)),
        (MKRect<Double>(x: -10, y: -40, width: 30, height: 40), MKPoint<Double>(x: 20, y: 0)),
    ])
    func bottomRight(args: (MKRect<Double>, MKPoint<Double>)) {
        let (rect, point) = args

        #expect(rect.bottomRight.isEqual(to: point, tolerance: tolerance))
    }
}
