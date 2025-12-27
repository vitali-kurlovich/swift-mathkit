//
//  RectTransformInverseTests.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 27.12.25.
//

import CoreFoundation
import MathKit
import Testing

private let tolerance: Double = 0.0001

@Suite("RectTransform Inverse")
struct RectTransformInverseTests {
    @Test("Identity")
    func identity() {
        let tr = RectTransform(.init(origin: .zero, size: .init(width: 1, height: 1)))

        #expect(
            tr.inverse(.init(x: 0, y: 0))
                .isEqual(to: .init(x: 0, y: 0), tolerance: tolerance)
        )

        #expect(
            tr.inverse(.init(x: 0.5, y: 0.5))
                .isEqual(to: .init(x: 0.5, y: 0.5), tolerance: tolerance)
        )

        #expect(
            tr.inverse(.init(x: 1, y: 1))
                .isEqual(to: .init(x: 1, y: 1), tolerance: tolerance)
        )
    }

    @Test("Identity with offset")
    func identityWithOffset() {
        let tr = RectTransform(.init(origin: .init(x: 10, y: 20), size: .init(width: 1, height: 1)))

        #expect(
            tr.inverse(.init(x: 10, y: 20))
                .isEqual(to: .init(x: 0, y: 0), tolerance: tolerance)
        )

        #expect(
            tr.inverse(.init(x: 10.5, y: 20.5))
                .isEqual(to: .init(x: 0.5, y: 0.5), tolerance: tolerance)
        )

        #expect(
            tr.inverse(.init(x: 11, y: 21))
                .isEqual(to: .init(x: 1, y: 1), tolerance: tolerance)
        )
    }

    @Test("Transform with offset")
    func transformWithOffset() {
        let tr = RectTransform(.init(origin: .init(x: 100, y: 200), size: .init(width: 200, height: 400)))

        #expect(
            tr.inverse(.init(x: 100, y: 200))
                .isEqual(to: .init(x: 0, y: 0), tolerance: tolerance)
        )

        #expect(
            tr.inverse(.init(x: 200, y: 400))
                .isEqual(to: .init(x: 0.5, y: 0.5), tolerance: tolerance)
        )

        #expect(
            tr.inverse(.init(x: 300, y: 600))
                .isEqual(to: .init(x: 1, y: 1), tolerance: tolerance)
        )
    }
}
