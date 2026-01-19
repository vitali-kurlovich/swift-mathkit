//
//  MKAffineTransformTests.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 6.01.26.
//

import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.00000001

@Suite("MKAffineTransform")
struct MKAffineTransformTests {}

// Init
extension MKAffineTransformTests {
    @Test("Init")
    func initTransform() {
        #expect(MKAffineTransform<Double>() == .identity)
        #expect(MKAffineTransform<Double>() == .init(m11: 1.0, m12: 0.0, m21: 0.0, m22: 1.0, tx: 0.0, ty: 0.0))
    }

    @Test("Init translation")
    func initTranslation() {
        #expect(MKAffineTransform<Double>(translationByX: 3, byY: 6) == .init(m11: 1.0, m12: 0.0, m21: 0.0, m22: 1.0, tx: 3.0, ty: 6.0))
        #expect(MKAffineTransform<Double>(translationByX: 3, byY: 6) == .translation(x: 3, y: 6))
    }

    @Test("Init scale")
    func initScale() {
        #expect(MKAffineTransform<Double>(scale: 4) == .init(m11: 4.0, m12: 0.0, m21: 0.0, m22: 4.0, tx: 0.0, ty: 0.0))
        #expect(MKAffineTransform<Double>(scale: 4) == .scale(4))
        #expect(MKAffineTransform<Double>(scaleByX: 3, byY: 5) == .init(m11: 3.0, m12: 0.0, m21: 0.0, m22: 5.0, tx: 0.0, ty: 0.0))
        #expect(MKAffineTransform<Double>(scaleByX: 3, byY: 5) == .scale(x: 3, y: 5))
    }

    @Test("Init rotation")
    func initRotate() {
        #expect(MKAffineTransform<Double>(MKAngle()) == .init(m11: 1.0, m12: 0.0, m21: 0.0, m22: 1.0, tx: 0.0, ty: 0.0))

        #expect(MKAffineTransform<Double>(.radians(.pi / 2)) == .rotation(.radians(.pi / 2)))

        #expect(
            MKAffineTransform<Double>(.radians(.pi / 2))
                .isEqual(to: .init(m11: 0, m12: 1.0, m21: -1.0, m22: 0, tx: 0.0, ty: 0.0), tolerance: tolerance)
        )

        #expect(MKAffineTransform<Double>(.radians(.pi))
            .isEqual(to: .init(m11: -1.0, m12: 0, m21: 0, m22: -1.0, tx: 0.0, ty: 0.0), tolerance: tolerance))

        #expect(MKAffineTransform<Double>(.radians(.pi / 8))
            .isEqual(to: .init(m11: 0.9238795325112866, m12: 0.3826834323650898,
                               m21: -0.3826834323650898, m22: 0.9238795325112866,
                               tx: 0.0, ty: 0.0), tolerance: tolerance))

        #expect(MKAffineTransform<Double>(.degrees(66))
            .isEqual(to: .init(m11: 0.4067366430758002, m12: 0.9135454576426009,
                               m21: -0.9135454576426009, m22: 0.4067366430758002,
                               tx: 0.0, ty: 0.0), tolerance: tolerance))
    }
}

// Mutation
extension MKAffineTransformTests {
    @Test("Translate")
    func translate() {
        var mk = MKAffineTransform<CGFloat>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        mk.translate(x: 20, y: 30)

        var tr = CoreAffineTransform(m11: 1, m12: 2, m21: 3, m22: 4, tX: 5, tY: 6)
        tr.translate(x: 20, y: 30)

        #expect(mk == tr)
    }

    @Test("Rotate")
    func rotate() {
        var mk = MKAffineTransform<CGFloat>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        mk.rotate(MKAngle(radians: .pi / 4))

        
        
        
        var tr = CoreAffineTransform(m11: 1, m12: 2, m21: 3, m22: 4, tX: 5, tY: 6)
        tr.rotate(byRadians: .pi / 4)

        #expect(mk.isEqual(to: .init(tr), tolerance: tolerance))
    }

    @Test("Scale")
    func scale() {
        var mk = MKAffineTransform<Double>.identity
        mk.scale(6)
        #expect(
            mk == .scale(6)
        )

        mk = .identity
        mk.scale(x: 4, y: 7)

        #expect(
            mk == .scale(x: 4, y: 7)
        )

        mk = .init(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)

        var tr = MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)

        mk.scale(x: 20, y: 50)

        tr.prepend(.scale(x: 20, y: 50))

        #expect(mk == tr)
    }

    @Test("Append")
    func append() {
        var mk1 = MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        let mk2 = MKAffineTransform<Double>(m11: 7, m12: 8, m21: 9, m22: 10, tx: 11, ty: 12)

        mk1.append(mk2)

        #expect(mk1 == .init(m11: 25.0, m12: 28.0, m21: 57.0, m22: 64.0, tx: 100.0, ty: 112.0))
    }

    @Test("Prepend")
    func prepend() {
        var mk1 = MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        let mk2 = MKAffineTransform<Double>(m11: 7, m12: 8, m21: 9, m22: 10, tx: 11, ty: 12)

        mk1.prepend(mk2)

        #expect(mk1 == .init(m11: 31.0, m12: 46.0, m21: 39.0, m22: 58.0, tx: 52.0, ty: 76.0))
    }

    @Test("Invert")
    func invert() throws {
        var mk = MKAffineTransform<CGFloat>()
        mk.translate(x: 2, y: 5)
        mk.rotate(.radians(.pi / 4))
        mk.scale(x: 4, y: 3)
        mk.rotate(.radians(.pi / 4))

        var inv = MKAffineTransform<CGFloat>()
        inv.rotate(.radians(-.pi / 4))
        inv.scale(x: 1 / 4, y: 1 / 3)
        inv.rotate(.radians(-.pi / 4))
        inv.translate(x: -2, y: -5)

        let inverted = try #require(mk.inverted())

        #expect(inv.isEqual(to: inverted, tolerance: tolerance))

        mk.invert()

        #expect(inv.isEqual(to: mk, tolerance: tolerance))
    }

    @Test("Invert point")
    func invertPoint() throws {
        var mk = MKAffineTransform<Double>()

        mk.translate(x: 2, y: 5)
        mk.rotate(.radians(.pi / 4))
        mk.scale(x: 4, y: 3)
        mk.rotate(.radians(.pi / 4))

        let inverted = try #require(mk.inverted())

        let point = MKPoint<Double>(x: 20, y: 50)

        #expect(
            mk.inverse(point).isEqual(to: inverted.transform(point), tolerance: tolerance)
        )
    }
}

// Transform
extension MKAffineTransformTests {
    @Test("Transform Point")
    func transform_point() {
        var mk = MKAffineTransform<Double>()
        let point = MKPoint<Double>(x: 20, y: 40)
        #expect(mk.transform(point) == point)

        mk.translate(x: 2, y: 5)
        mk.rotate(.radians(.pi / 4))
        mk.scale(x: 4, y: 3)
        mk.rotate(.radians(.pi / 4))

        #expect(mk.transform(point).isEqual(to: MKPoint(x: -128, y: 55), tolerance: tolerance))
    }

    @Test("Transform Rect")
    func transform_rect() {
        let mk = MKAffineTransform<CGFloat>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
        let rect = CGRect(x: 20, y: 90, width: 200, height: 120)
        #expect(mk.transform(rect) == .init(x: 295.0, y: 406.0, width: 560.0, height: 880.0))
    }
}
