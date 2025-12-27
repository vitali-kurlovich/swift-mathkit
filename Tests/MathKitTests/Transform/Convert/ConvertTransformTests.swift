//
//  ConvertTransformTests.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 27.12.25.
//

import CoreFoundation
import MathKit
import Testing

private let tolerance: Double = 0.0001

@Suite("ConvertTransform Transform")
struct ConvertTransformTests {
    @Test("Transform")
    func transform() {
        let from = RectTransform(.init(origin: .init(x: 100, y: 200), size: .init(width: 200, height: 400)))

        let p0 = CGPoint(x: -10, y: -20)
        let p1 = CGPoint(x: 10, y: -10)
        let p2 = CGPoint(x: 15, y: 20)
        let p3 = CGPoint(x: -20, y: 15)

        let to = ControlPointsTransform(p0: p0, p1: p1, p2: p2, p3: p3)

        let tr = ConvertTransform(from: from, to: to)

        #expect(
            tr.transform(.init(x: 100, y: 200))
                .isEqual(to: p0, tolerance: tolerance)
        )

        #expect(
            tr.transform(.init(x: 300, y: 200))
                .isEqual(to: p1, tolerance: tolerance)
        )

        #expect(
            tr.transform(.init(x: 300, y: 600))
                .isEqual(to: p2, tolerance: tolerance)
        )

        #expect(
            tr.transform(.init(x: 100, y: 600))
                .isEqual(to: p3, tolerance: tolerance)
        )

        #expect(
            tr.transform(.init(x: 200, y: 400))
                .isEqual(to: to.transform(.init(x: 0.5, y: 0.5)), tolerance: tolerance)
        )
    }

    @Test("Inverse")
    func inverse() {
        let from = RectTransform(.init(origin: .init(x: 100, y: 200), size: .init(width: 200, height: 400)))

        let p0 = CGPoint(x: -10, y: -20)
        let p1 = CGPoint(x: 10, y: -10)
        let p2 = CGPoint(x: 15, y: 20)
        let p3 = CGPoint(x: -20, y: 15)

        let to = ControlPointsTransform(p0: p0, p1: p1, p2: p2, p3: p3)

        let tr = ConvertTransform(from: from, to: to)

        #expect(
            tr.inverse(p0)
                .isEqual(to: .init(x: 100, y: 200), tolerance: tolerance)
        )

        #expect(
            tr.inverse(p1)
                .isEqual(to: .init(x: 300, y: 200), tolerance: tolerance)
        )

        #expect(
            tr.inverse(p2)
                .isEqual(to: .init(x: 300, y: 600), tolerance: tolerance)
        )

        #expect(
            tr.inverse(p3)
                .isEqual(to: .init(x: 100, y: 600), tolerance: tolerance)
        )

        #expect(
            tr.inverse(to.transform(.init(x: 0.5, y: 0.5)))
                .isEqual(to: .init(x: 200, y: 400), tolerance: tolerance)
        )
    }
}
