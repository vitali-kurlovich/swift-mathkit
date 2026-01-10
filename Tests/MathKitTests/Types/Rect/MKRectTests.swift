//
//  MKRectTests.swift
//  swift-mathkit
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

    @Test("Zero")
    func zero() {
        #expect(Rect.zero.origin == .zero)
        #expect(Rect.zero.size == .zero)
    }

    @Test("Min/Max")
    func minmax() {
        let rect = Rect(x: 10, y: 20, width: 30, height: 40)
        let expected = CGRect(x: 10, y: 20, width: 30, height: 40)

        #expect(rect == expected)
        #expect(expected == rect)

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
