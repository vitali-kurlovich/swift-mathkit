//
//  MKAffineTransformTests.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 6.01.26.
//

import Foundation
@testable import MathKit
import Testing

@Suite("MKAffineTransform")
struct MKAffineTransformTests {}

// Init
extension MKAffineTransformTests {
    @Test("Init")
    func initTransform() {
        #expect(MKAffineTransform<CGFloat>() == AffineTransform())

        #expect(MKAffineTransform<CGFloat>.identity == AffineTransform.identity)
    }

    @Test("Init translation")
    func initTranslation() {
        #expect(MKAffineTransform<CGFloat>(translationByX: 3, byY: 6) == AffineTransform(translationByX: 3, byY: 6))
    }

    @Test("Init scale")
    func initScale() {
        #expect(MKAffineTransform<CGFloat>(scale: 4) == AffineTransform(scale: 4))

        #expect(MKAffineTransform<CGFloat>(scaleByX: 3, byY: 5) == AffineTransform(scaleByX: 3, byY: 5))
    }

    @Test("Init rotation")
    func initRotate() {
        #expect(MKAffineTransform<CGFloat>(rotationByRadians: 0) == AffineTransform(rotationByRadians: 0))

        #expect(MKAffineTransform<CGFloat>(rotationByRadians: .pi / 2) == AffineTransform(rotationByRadians: .pi / 2))

        #expect(MKAffineTransform<CGFloat>(rotationByRadians: .pi) == AffineTransform(rotationByRadians: .pi))

        #expect(MKAffineTransform<CGFloat>(rotationByRadians: .pi / 8) == AffineTransform(rotationByRadians: .pi / 8))

        #expect(MKAffineTransform<CGFloat>(rotationByDegrees: 66) == AffineTransform(rotationByDegrees: 66))
    }
}

// Mutation
extension MKAffineTransformTests {
    @Test("Translate")
    func translate() {
        var mk = MKAffineTransform<CGFloat>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        mk.translate(x: 20, y: 30)

        var tr = AffineTransform(m11: 1, m12: 2, m21: 3, m22: 4, tX: 5, tY: 6)
        tr.translate(x: 20, y: 30)

        #expect(mk == tr)
    }

    @Test("Rotate")
    func rotate() {
        var mk = MKAffineTransform<CGFloat>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        mk.rotate(byRadians: .pi / 4)

        var tr = AffineTransform(m11: 1, m12: 2, m21: 3, m22: 4, tX: 5, tY: 6)
        tr.rotate(byRadians: .pi / 4)

        #expect(mk == tr)
    }

    @Test("Scale")
    func scale() {
        var mk = MKAffineTransform<CGFloat>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        mk.scale(6)

        var tr = AffineTransform(m11: 1, m12: 2, m21: 3, m22: 4, tX: 5, tY: 6)
        tr.scale(6)

        #expect(mk == tr)

        mk.scale(x: 4, y: 7)
        tr.scale(x: 4, y: 7)

        #expect(mk == tr)
    }

    @Test("Append")
    func append() {
        var mk1 = MKAffineTransform<CGFloat>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        let mk2 = MKAffineTransform<CGFloat>(m11: 7, m12: 8, m21: 9, m22: 10, tx: 11, ty: 12)

        mk1.append(mk2)

        var t1 = AffineTransform(m11: 1, m12: 2, m21: 3, m22: 4, tX: 5, tY: 6)
        let t2 = AffineTransform(m11: 7, m12: 8, m21: 9, m22: 10, tX: 11, tY: 12)

        t1.append(t2)

        #expect(mk1 == t1)
    }

    @Test("Prepend")
    func prepend() {
        var mk1 = MKAffineTransform<CGFloat>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        let mk2 = MKAffineTransform<CGFloat>(m11: 7, m12: 8, m21: 9, m22: 10, tx: 11, ty: 12)

        mk1.prepend(mk2)

        var t1 = AffineTransform(m11: 1, m12: 2, m21: 3, m22: 4, tX: 5, tY: 6)
        let t2 = AffineTransform(m11: 7, m12: 8, m21: 9, m22: 10, tX: 11, tY: 12)

        t1.prepend(t2)

        #expect(mk1 == t1)
    }

    @Test("Invert")
    func invert() {
        var mk = MKAffineTransform<CGFloat>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        mk.invert()

        var tr = AffineTransform(m11: 1, m12: 2, m21: 3, m22: 4, tX: 5, tY: 6)
        tr.invert()

        #expect(mk == tr)

        mk = MKAffineTransform<CGFloat>()
        tr = AffineTransform()

        mk.translate(x: 2, y: 5)
        mk.rotate(byRadians: .pi / 4)
        mk.scale(x: 4, y: 3)
        mk.rotate(byRadians: .pi / 4)

        tr.translate(x: 2, y: 5)
        tr.rotate(byRadians: .pi / 4)
        tr.scale(x: 4, y: 3)
        tr.rotate(byRadians: .pi / 4)

        mk.invert()
        tr.invert()

        #expect(mk == tr)
    }

    @Test("Inverted")
    func inverted() throws {
        var mk = MKAffineTransform<CGFloat>()

        var tr = AffineTransform()

        mk.translate(x: 2, y: 5)
        mk.rotate(byRadians: .pi / 4)
        mk.scale(x: 4, y: 3)
        mk.rotate(byRadians: .pi / 4)

        tr.translate(x: 2, y: 5)
        tr.rotate(byRadians: .pi / 4)
        tr.scale(x: 4, y: 3)
        tr.rotate(byRadians: .pi / 4)

        let mkInverted = try #require(mk.inverted())
        let trInverted = try #require(tr.inverted())

        #expect(mkInverted == trInverted)
    }
}

// Transform
extension MKAffineTransformTests {
    @Test("Transform")
    func transform() {
        let mk = MKAffineTransform<CGFloat>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)

        let tr = AffineTransform(m11: 1, m12: 2, m21: 3, m22: 4, tX: 5, tY: 6)

        let point = CGPoint(x: 20, y: 90)

        #expect(mk.transform(point) == tr.transform(point))
    }
}
