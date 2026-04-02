//
//  Created by Vitali Kurlovich on 10.01.26.
//

import Foundation
import MathKit
import Testing

private let tolerance: CGFloat = 0.00000001

@Suite("MKPoint")
struct MKRectTests {
    typealias Rect = MKRect<CGFloat>
    typealias Point = MKPoint<CGFloat>

    @Test("Zero")
    func zero() {
        let rect = Rect.zero

        #expect(rect.origin == .zero)
        #expect(rect.size == .zero)
    }

    @Test("Identity")
    func identity() throws {
        let rect = Rect.identity

        #expect(rect.origin == .zero)
        #expect(rect.size == .identity)
    }

    @Test("aspectRatio")
    func aspectRatio() throws {
        #expect(Rect.identity.aspectRatio.isEqual(to: 1, tolerance: tolerance))

        #expect(Rect(x: 20, y: 10, width: 200, height: 100).aspectRatio.isEqual(to: 2, tolerance: tolerance))
        #expect(Rect(x: 20, y: 10, width: 200, height: 400).aspectRatio.isEqual(to: 0.5, tolerance: tolerance))
    }

    @Test("Min/Max")
    func minmax() {
        let rect = Rect(x: 10, y: 20, width: 30, height: 40)
        let expected = CGRect(x: 10, y: 20, width: 30, height: 40)

        #expect(CGRect(rect) == expected)
        #expect(Rect(expected) == rect)

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
    @Test("Top-Center", arguments: [
        (Rect(x: 0, y: 0, width: 30, height: 40), Point(x: 15, y: 0)),
        (Rect(x: 10, y: 20, width: 30, height: 40), Point(x: 25, y: 20)),
        (Rect(x: -10, y: -40, width: 30, height: 40), Point(x: 5, y: -40)),
    ])
    func topCenter(args: (Rect, Point)) {
        let (rect, point) = args

        #expect(rect.top.isEqual(to: point, tolerance: tolerance))
    }

    @Test("Center", arguments: [
        (Rect(x: 0, y: 0, width: 30, height: 40), Point(x: 15, y: 20)),
        (Rect(x: 10, y: 20, width: 30, height: 40), Point(x: 25, y: 40)),
        (Rect(x: -10, y: -40, width: 30, height: 40), Point(x: 5, y: -20)),
    ])
    func center(args: (Rect, Point)) {
        let (rect, point) = args

        #expect(rect.center.isEqual(to: point, tolerance: tolerance))
    }

    @Test("Bottom-Center", arguments: [
        (Rect(x: 0, y: 0, width: 30, height: 40), Point(x: 15, y: 40)),
        (Rect(x: 10, y: 20, width: 30, height: 40), Point(x: 25, y: 60)),
        (Rect(x: -10, y: -40, width: 30, height: 40), Point(x: 5, y: 0)),
    ])
    func nottomCenter(args: (Rect, Point)) {
        let (rect, point) = args

        #expect(rect.bottom.isEqual(to: point, tolerance: tolerance))
    }
}

extension MKRectTests {
    @Test("Top-Left", arguments: [
        (Rect(x: 0, y: 0, width: 30, height: 40), Point(x: 0, y: 0)),
        (Rect(x: 10, y: 20, width: 30, height: 40), Point(x: 10, y: 20)),
        (Rect(x: -10, y: -40, width: 30, height: 40), Point(x: -10, y: -40)),
    ])
    func topLeft(args: (Rect, Point)) {
        let (rect, point) = args

        #expect(rect.topLeft.isEqual(to: point, tolerance: tolerance))
    }

    @Test("Left", arguments: [
        (Rect(x: 0, y: 0, width: 30, height: 40), Point(x: 0, y: 20)),
        (Rect(x: 10, y: 20, width: 30, height: 40), Point(x: 10, y: 40)),
        (Rect(x: -10, y: -40, width: 30, height: 40), Point(x: -10, y: -20)),
    ])
    func left(args: (Rect, Point)) {
        let (rect, point) = args

        #expect(rect.left.isEqual(to: point, tolerance: tolerance))
    }

    @Test("Bottom-Left", arguments: [
        (Rect(x: 0, y: 0, width: 30, height: 40), Point(x: 0, y: 40)),
        (Rect(x: 10, y: 20, width: 30, height: 40), Point(x: 10, y: 60)),
        (Rect(x: -10, y: -40, width: 30, height: 40), Point(x: -10, y: 0)),
    ])
    func bottomLeft(args: (Rect, Point)) {
        let (rect, point) = args

        #expect(rect.bottomLeft.isEqual(to: point, tolerance: tolerance))
    }
}

extension MKRectTests {
    @Test("Top-Right", arguments: [
        (Rect(x: 0, y: 0, width: 30, height: 40), Point(x: 30, y: 0)),
        (Rect(x: 10, y: 20, width: 30, height: 40), Point(x: 40, y: 20)),
        (Rect(x: -10, y: -40, width: 30, height: 40), Point(x: 20, y: -40)),
    ])
    func topRight(args: (Rect, Point)) {
        let (rect, point) = args

        #expect(rect.topRight.isEqual(to: point, tolerance: tolerance))
    }

    @Test("Right", arguments: [
        (Rect(x: 0, y: 0, width: 30, height: 40), Point(x: 30, y: 20)),
        (Rect(x: 10, y: 20, width: 30, height: 40), Point(x: 40, y: 40)),
        (Rect(x: -10, y: -40, width: 30, height: 40), Point(x: 20, y: -20)),
    ])
    func right(args: (Rect, Point)) {
        let (rect, point) = args

        #expect(rect.right.isEqual(to: point, tolerance: tolerance))
    }

    @Test("Bottom-Right", arguments: [
        (Rect(x: 0, y: 0, width: 30, height: 40), Point(x: 30, y: 40)),
        (Rect(x: 10, y: 20, width: 30, height: 40), Point(x: 40, y: 60)),
        (Rect(x: -10, y: -40, width: 30, height: 40), Point(x: 20, y: 0)),
    ])
    func bottomRight(args: (Rect, Point)) {
        let (rect, point) = args

        #expect(rect.bottomRight.isEqual(to: point, tolerance: tolerance))
    }
}
