//
//  Affine2DTransformTests.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 28.12.25.
//

import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.0001

@Suite("Affine2DTransform")
struct Affine2DTransformTests {
    @Test("inverse Transform")
    func inverseTransform() throws {
        var transform = AffineTransform(rotationByDegrees: 45)
        transform.prepend(AffineTransform(translationByX: 2, byY: 5))
        transform.prepend(AffineTransform(scaleByX: 3, byY: 7))

        let affine = Affine2DTransform(transform)

        let inverseTransform = try #require(affine.inverseTransform)

        let expected = try #require(transform.inverted())

        #expect(AffineTransform(inverseTransform) == expected)
    }
}
