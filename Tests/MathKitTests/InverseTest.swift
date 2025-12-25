//
//  InverseTest.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 24.12.25.
//

import MathKit
import Testing

import struct CoreFoundation.CGPoint

private let tolerance: Double = 0.0001

@Suite("Inverse Transform Test Cases")
struct InverseTransformTests {
    /*
     @Test("Normalized points")
     func normalized() {
         let p0 = CGPoint(x: 0, y: 0)
         let p1 = CGPoint(x: 1, y: 0)
         let p2 = CGPoint(x: 1, y: 1)
         let p3 = CGPoint(x: 0, y: 1)

         #expect(
             inverse(p0: p0, p1: p1, p2: p2, p3: p3,
                     target: CGPoint(x: 0, y: 0))
                 .isEqual(to: CGPoint(x: 0, y: 0), tolerance: tolerance)
         )

         #expect(
             inverse(p0: p0, p1: p1, p2: p2, p3: p3,
                     target: CGPoint(x: 1, y: 0))
                 .isEqual(to: CGPoint(x: 1, y: 0), tolerance: tolerance)
         )

         #expect(
             inverse(p0: p0, p1: p1, p2: p2, p3: p3,
                     target: CGPoint(x: 1, y: 1))
                 .isEqual(to: CGPoint(x: 1, y: 1), tolerance: tolerance)
         )

         #expect(
             inverse(p0: p0, p1: p1, p2: p2, p3: p3,
                     target: CGPoint(x: 1, y: 0))
                 .isEqual(to: CGPoint(x: 1, y: 0), tolerance: tolerance)
         )

         #expect(
             inverse(p0: p0, p1: p1, p2: p2, p3: p3,
                     target: CGPoint(x: 0.5, y: 0.5))
                 .isEqual(to: CGPoint(x: 0.5, y: 0.5), tolerance: tolerance)
         )

         #expect(
             inverse(p0: p0, p1: p1, p2: p2, p3: p3,
                     target: CGPoint(x: 0.25, y: 0.75))
                 .isEqual(to: CGPoint(x: 0.25, y: 0.75), tolerance: tolerance)
         )
     }
     */

    @Test("Random points")
    func random() {
        let p0 = CGPoint(x: -10, y: -20)
        let p1 = CGPoint(x: 10, y: -10)
        let p2 = CGPoint(x: 15, y: 20)
        let p3 = CGPoint(x: -20, y: 15)

        #expect(
            inverse(p0: p0, p1: p1, p2: p2, p3: p3, target: p0)
                .isEqual(to: CGPoint(x: 0, y: 0), tolerance: tolerance)
        )

        #expect(
            inverse(p0: p0, p1: p1, p2: p2, p3: p3, target: p1)
                .isEqual(to: CGPoint(x: 1, y: 0), tolerance: tolerance)
        )

        #expect(
            inverse(p0: p0, p1: p1, p2: p2, p3: p3, target: p2)
                .isEqual(to: CGPoint(x: 1, y: 1), tolerance: tolerance)
        )

        #expect(
            inverse(p0: p0, p1: p1, p2: p2, p3: p3, target: p3)
                .isEqual(to: CGPoint(x: 0, y: 1), tolerance: tolerance)
        )
    }

    @Test("Random points opt")
    func randomOpt() {
        let p0 = CGPoint(x: -10, y: -20)
        let p1 = CGPoint(x: 10, y: -10)
        let p2 = CGPoint(x: 15, y: 20)
        let p3 = CGPoint(x: -20, y: 15)

        #expect(
            inverse_opt(p0: p0, p1: p1, p2: p2, p3: p3, target: p0)
                .isEqual(to: CGPoint(x: 0, y: 0), tolerance: tolerance)
        )

        #expect(
            inverse_opt(p0: p0, p1: p1, p2: p2, p3: p3, target: p1)
                .isEqual(to: CGPoint(x: 1, y: 0), tolerance: tolerance)
        )

        #expect(
            inverse_opt(p0: p0, p1: p1, p2: p2, p3: p3, target: p2)
                .isEqual(to: CGPoint(x: 1, y: 1), tolerance: tolerance)
        )

        #expect(
            inverse_opt(p0: p0, p1: p1, p2: p2, p3: p3, target: p3)
                .isEqual(to: CGPoint(x: 0, y: 1), tolerance: tolerance)
        )
    }

    @Test("Random points mirrored by vertical")
    func verticalMirror() {
        let p1 = CGPoint(x: -10, y: -20)
        let p0 = CGPoint(x: 10, y: -10)
        let p3 = CGPoint(x: 15, y: 20)
        let p2 = CGPoint(x: -20, y: 15)

        #expect(
            inverse(p0: p0, p1: p1, p2: p2, p3: p3, target: p0)
                .isEqual(to: CGPoint(x: 0, y: 0), tolerance: tolerance)
        )

        #expect(
            inverse(p0: p0, p1: p1, p2: p2, p3: p3, target: p1)
                .isEqual(to: CGPoint(x: 1, y: 0), tolerance: tolerance)
        )

        #expect(
            inverse(p0: p0, p1: p1, p2: p2, p3: p3, target: p2)
                .isEqual(to: CGPoint(x: 1, y: 1), tolerance: tolerance)
        )

        #expect(
            inverse(p0: p0, p1: p1, p2: p2, p3: p3, target: p3)
                .isEqual(to: CGPoint(x: 0, y: 1), tolerance: tolerance)
        )
    }

    @Test("Random points mirrored by vertical (opt)")
    func verticalMirrorOpt() {
        let p1 = CGPoint(x: -10, y: -20)
        let p0 = CGPoint(x: 10, y: -10)
        let p3 = CGPoint(x: 15, y: 20)
        let p2 = CGPoint(x: -20, y: 15)

        #expect(
            inverse_opt(p0: p0, p1: p1, p2: p2, p3: p3, target: p0)
                .isEqual(to: CGPoint(x: 0, y: 0), tolerance: tolerance)
        )

        #expect(
            inverse_opt(p0: p0, p1: p1, p2: p2, p3: p3, target: p1)
                .isEqual(to: CGPoint(x: 1, y: 0), tolerance: tolerance)
        )

        #expect(
            inverse_opt(p0: p0, p1: p1, p2: p2, p3: p3, target: p2)
                .isEqual(to: CGPoint(x: 1, y: 1), tolerance: tolerance)
        )

        #expect(
            inverse_opt(p0: p0, p1: p1, p2: p2, p3: p3, target: p3)
                .isEqual(to: CGPoint(x: 0, y: 1), tolerance: tolerance)
        )
    }
}
