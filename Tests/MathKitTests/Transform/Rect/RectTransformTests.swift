//
//  RectTransformTests.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 27.12.25.
//

import CoreFoundation
import MathKit
import Testing

private let tolerance: Double = 0.0001

@Suite("RectTransform Transform")
struct RectTransformTests {
    @Test("Identity")
    func identity() {
        let tr = RectTransform(.init(origin: .zero, size: .init(width: 1, height: 1)))

        #expect(
            tr.transform(.init(x: 0, y: 0))
                .isEqual(to: .init(x: 0, y: 0), tolerance: tolerance)
        )

        #expect(
            tr.transform(.init(x: 0.5, y: 0.5))
                .isEqual(to: .init(x: 0.5, y: 0.5), tolerance: tolerance)
        )

        #expect(
            tr.transform(.init(x: 1, y: 1))
                .isEqual(to: .init(x: 1, y: 1), tolerance: tolerance)
        )
    }

    @Test("Identity with offset")
    func identityWithOffset() {
        let tr = RectTransform(.init(origin: .init(x: 10, y: 20), size: .init(width: 1, height: 1)))

        #expect(
            tr.transform(.init(x: 0, y: 0))
                .isEqual(to: .init(x: 10, y: 20), tolerance: tolerance)
        )

        #expect(
            tr.transform(.init(x: 0.5, y: 0.5))
                .isEqual(to: .init(x: 10.5, y: 20.5), tolerance: tolerance)
        )

        #expect(
            tr.transform(.init(x: 1, y: 1))
                .isEqual(to: .init(x: 11, y: 21), tolerance: tolerance)
        )
    }

    @Test("Transform")
    func transform() {
        let tr = RectTransform(.init(origin: .zero, size: .init(width: 100, height: 200)))

        #expect(
            tr.transform(.init(x: 0, y: 0))
                .isEqual(to: .init(x: 0, y: 0), tolerance: tolerance)
        )

        #expect(
            tr.transform(.init(x: 0.5, y: 0.5))
                .isEqual(to: .init(x: 50, y: 100), tolerance: tolerance)
        )

        #expect(
            tr.transform(.init(x: 1, y: 1))
                .isEqual(to: .init(x: 100, y: 200), tolerance: tolerance)
        )
    }

    @Test("Transform with offset")
    func transformWithOffset() {
        let tr = RectTransform(.init(origin: .init(x: 100, y: 200), size: .init(width: 200, height: 400)))

        #expect(
            tr.transform(.init(x: 0, y: 0))
                .isEqual(to: .init(x: 100, y: 200), tolerance: tolerance)
        )

        #expect(
            tr.transform(.init(x: 0.5, y: 0.5))
                .isEqual(to: .init(x: 200, y: 400), tolerance: tolerance)
        )

        #expect(
            tr.transform(.init(x: 1, y: 1))
                .isEqual(to: .init(x: 300, y: 600), tolerance: tolerance)
        )
    }
}
