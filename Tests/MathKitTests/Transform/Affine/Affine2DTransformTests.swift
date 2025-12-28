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
    @Test("Identity")
    func identity() throws {
        #expect(
            Affine2DTransform.identity == Affine2DTransform(AffineTransform.identity)
        )
        #expect(
            Affine2DTransform.identity == Affine2DTransform()
        )
    }

    @Test("Accessors")
    func accessors() throws {
        var transform = Affine2DTransform(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        let expected = AffineTransform(m11: 1, m12: 2, m21: 3, m22: 4, tX: 5, tY: 6)

        #expect(
            transform.m11 == expected.m11
        )

        #expect(
            transform.m12 == expected.m12
        )

        #expect(
            transform.m21 == expected.m21
        )

        #expect(
            transform.m22 == expected.m22
        )

        #expect(
            transform.tx == expected.tX
        )

        #expect(
            transform.ty == expected.tY
        )

        transform.m11 = 1
        transform.m12 = 0
        transform.m21 = 0
        transform.m22 = 1

        transform.tx = 0
        transform.ty = 0

        #expect(
            transform == .identity
        )
    }

    @Test("inverse Transform")
    func inverse() throws {
        var expected = AffineTransform(rotationByDegrees: 45)
        expected.prepend(AffineTransform(translationByX: 2, byY: 5))
        expected.prepend(AffineTransform(scaleByX: 3, byY: 7))

        var transform = Affine2DTransform(expected)

        let inverseTransform = try #require(transform.inverted())

        expected = try #require(expected.inverted())

        #expect(
            AffineTransform(inverseTransform) == expected
        )

        transform.scale(0)

        #expect(
            transform.inverted() == nil
        )

        #expect(
            transform.determinant == 0
        )
    }

    @Test("Append")
    func append() throws {
        var transform = Affine2DTransform()
        transform.append(Affine2DTransform(rotation: .degrees(45)))
        transform.append(Affine2DTransform(scale: 3))
        transform.append(AffineTransform(translationByX: 10, byY: -10))

        var expected = AffineTransform()
        expected.append(Affine2DTransform(rotation: .degrees(45)))
        expected.append(AffineTransform(scale: 3))
        expected.append(AffineTransform(translationByX: 10, byY: -10))

        #expect(
            transform == Affine2DTransform(expected)
        )
    }

    @Test("Prepend")
    func prepend() throws {
        var transform = Affine2DTransform()
        transform.prepend(Affine2DTransform(rotation: .degrees(45)))
        transform.prepend(Affine2DTransform(scale: 3))
        transform.prepend(AffineTransform(translationByX: 10, byY: -10))

        var expected = AffineTransform()
        expected.prepend(Affine2DTransform(rotation: .degrees(45)))
        expected.prepend(AffineTransform(scale: 3))
        expected.prepend(AffineTransform(translationByX: 10, byY: -10))

        #expect(
            transform == Affine2DTransform(expected)
        )
    }

    @Test("Rotation")
    func rotation() throws {
        var transform = Affine2DTransform(rotation: .degrees(45))

        #expect(
            transform == Affine2DTransform(AffineTransform(rotationByDegrees: 45))
        )

        transform = .identity
        transform.rotate(.degrees(270))

        #expect(
            transform == Affine2DTransform(AffineTransform(rotationByDegrees: 270))
        )
    }

    @Test("Scale")
    func scale() {
        #expect(
            Affine2DTransform(scale: 3) == Affine2DTransform(AffineTransform(scale: 3))
        )

        #expect(
            Affine2DTransform(scaleByX: 4, byY: 6) == Affine2DTransform(AffineTransform(scaleByX: 4, byY: 6))
        )

        var transform = Affine2DTransform()
        transform.scale(4)

        #expect(
            transform == Affine2DTransform(AffineTransform(scale: 4))
        )

        transform = Affine2DTransform()

        transform.scale(x: 3, y: 5)

        #expect(
            transform == Affine2DTransform(AffineTransform(scaleByX: 3, byY: 5))
        )
    }

    @Test("Translate")
    func translate() {
        #expect(
            Affine2DTransform(translationByX: 4, byY: 8) == Affine2DTransform(AffineTransform(translationByX: 4, byY: 8))
        )

        var transform = Affine2DTransform()
        transform.translate(x: 12, y: 24)

        #expect(
            transform == Affine2DTransform(AffineTransform(translationByX: 12, byY: 24))
        )
    }
}
