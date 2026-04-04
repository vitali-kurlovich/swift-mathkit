//
//  Created by Vitali Kurlovich on 02.04.2026.
//

import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.000001
private let halfTolerance: Float32 = 0.0001
private let lowTolerance: Float16 = 0.1

@Suite("MKVector")
struct MKVectorTests {}

extension MKVectorTests {
    @Test("Constructor <Double>")
    func constructorDouble() throws {
        let vc = MKVector<Double>(dx: 2, dy: 3)
        let cg = CGVector(vc)
        let conv = MKVector<Double>(cg)

        #expect(vc.isEqual(to: conv, tolerance: tolerance))
    }

    @Test("Constructor <CGFloat>")
    func constructorCGFloat() throws {
        let vc = MKVector<CGFloat>(dx: 2, dy: 3)
        let cg = CGVector(vc)
        let conv = MKVector<CGFloat>(cg)

        #expect(vc.isEqual(to: conv, tolerance: tolerance))
    }

    @Test("Constructor <Float>")
    func constructorFloat() throws {
        let vc = MKVector<Float>(dx: 2, dy: 3)
        let cg = CGVector(vc)
        let conv = MKVector<Float>(cg)

        #expect(vc.isEqual(to: conv, tolerance: halfTolerance))
    }

    @Test("Constructor <Float16>")
    func constructorFloat16() throws {
        let vc = MKVector<Float16>(dx: 2, dy: 3)
        let cg = CGVector(vc)
        let conv = MKVector<Float16>(cg)

        #expect(vc.isEqual(to: conv, tolerance: lowTolerance))
    }
}

extension MKVectorTests {
    @Test("Zero")
    func zero() throws {
        let vec = MKVector<Double>.zero

        #expect(vec.dx == 0)
        #expect(vec.dy == 0)
    }

    @Test("Identity")
    func identity() throws {
        let vec = MKVector<Double>.identity

        #expect(vec.dx == 1)
        #expect(vec.dy == 1)
    }

    @Test("Negative")
    func negative() throws {
        let vec = MKVector<Double>(dx: 2, dy: 3)

        #expect((-vec).dx == -2)
        #expect((-vec).dy == -3)
    }

    @Test("Addittion")
    func add() throws {
        var vec = MKVector<Double>(dx: 2, dy: 3) + MKVector<Double>(dx: 10, dy: 7)

        #expect(vec.isEqual(to: .init(dx: 12, dy: 10), tolerance: tolerance))

        vec += MKVector<Double>(dx: 8, dy: 10)

        #expect(vec.isEqual(to: .init(dx: 20, dy: 20), tolerance: tolerance))
    }

    @Test("Addittion Size")
    func addSize() throws {
        var vec = MKVector<Double>(dx: 2, dy: 3) + MKSize<Double>(width: 10, height: 7)

        #expect(vec.isEqual(to: .init(dx: 12, dy: 10), tolerance: tolerance))

        vec += MKSize<Double>(width: 8, height: 10)

        #expect(vec.isEqual(to: .init(dx: 20, dy: 20), tolerance: tolerance))
    }

    @Test("Substraction")
    func sub() throws {
        var vec = MKVector<Double>(dx: 2, dy: 3) - MKVector<Double>(dx: 4, dy: 6)

        #expect(vec.isEqual(to: .init(dx: -2, dy: -3), tolerance: tolerance))

        vec -= MKVector<Double>(dx: 8, dy: 10)

        #expect(vec.isEqual(to: .init(dx: -10, dy: -13), tolerance: tolerance))
    }

    @Test("Substraction Size")
    func subSize() throws {
        var vec = MKVector<Double>(dx: 2, dy: 3) - MKSize<Double>(width: 4, height: 6)

        #expect(vec.isEqual(to: .init(dx: -2, dy: -3), tolerance: tolerance))

        vec -= MKSize<Double>(width: 8, height: 10)

        #expect(vec.isEqual(to: .init(dx: -10, dy: -13), tolerance: tolerance))
    }

    @Test("Multiply")
    func mul() throws {
        var vec = MKVector<Double>(dx: 2, dy: 3) * 2

        #expect(vec.isEqual(to: .init(dx: 4, dy: 6), tolerance: tolerance))

        vec *= 3

        #expect(vec.isEqual(to: .init(dx: 12, dy: 18), tolerance: tolerance))

        #expect((0.5 * vec).isEqual(to: .init(dx: 6, dy: 9), tolerance: tolerance))

        vec *= MKVector<Double>(dx: 20, dy: 10)

        #expect(vec.isEqual(to: .init(dx: 240, dy: 180), tolerance: tolerance))
    }

    @Test("Divide")
    func div() throws {
        var vec = MKVector<Double>(dx: 8, dy: 12) / 2

        #expect(vec.isEqual(to: .init(dx: 4, dy: 6), tolerance: tolerance))

        vec /= 2

        #expect(vec.isEqual(to: .init(dx: 2, dy: 3), tolerance: tolerance))

        #expect((6 / vec).isEqual(to: .init(dx: 3, dy: 2), tolerance: tolerance))

        vec /= MKVector<Double>(dx: 4, dy: 6)

        #expect(vec.isEqual(to: .init(dx: 0.5, dy: 0.5), tolerance: tolerance))
    }

    @Test("Magnitude")
    func magnitude() {
        let vector = MKVector<Double>(dx: 3, dy: 4)

        #expect(
            vector.magnitudeSquared == 25
        )

        #expect(
            vector.magnitude == 5
        )
    }

    @Test("Normalize")
    func normalize() {
        var vector = MKVector<Double>(dx: -30, dy: 40)

        #expect(
            vector.normalized() == MKVector<Double>(dx: -3 / 5, dy: 4 / 5)
        )

        vector.normalize()

        #expect(
            vector == MKVector<Double>(dx: -3 / 5, dy: 4 / 5)
        )

        #expect(
            vector.magnitudeSquared == 1
        )
    }

    @Test("Dot", arguments: [
        (MKVector<Double>(dx: 0, dy: 1), MKVector<Double>(dx: 0, dy: 1), 1.0),
        (MKVector<Double>(dx: 0, dy: -1), MKVector<Double>(dx: 0, dy: 1), -1.0),
        (MKVector<Double>(dx: -6, dy: 3), MKVector<Double>(dx: 5, dy: -2), -36.0),
        (MKVector<Double>(dx: 10, dy: 0), MKVector<Double>(dx: 0, dy: 10), 0.0),
        (MKVector<Double>(dx: 0.8660254038, dy: -0.5), MKVector<Double>(dx: 0.5, dy: 0.8660254038), 0.0),
    ])
    func dot(_ args: (MKVector<Double>, MKVector<Double>, Double)) {
        let (first, second, expect) = args
        #expect(first.dot(second).isEqual(to: expect, tolerance: tolerance))
    }

    @Test("Cross", arguments: [
        (MKVector<Double>(dx: 10, dy: 0), MKVector<Double>(dx: 0, dy: 10), 100.0),
        (MKVector<Double>(dx: 0, dy: 10), MKVector<Double>(dx: 10, dy: 0), -100.0),
        (MKVector<Double>(dx: 10, dy: 0), MKVector<Double>(dx: 10, dy: 10), 100.0),
        (MKVector<Double>(dx: 0.8660254038, dy: -0.5), MKVector<Double>(dx: 0.5, dy: 0.8660254038), 1.0),

    ])
    func cross(_ args: (MKVector<Double>, MKVector<Double>, Double)) {
        let (first, second, expect) = args
        #expect(first.cross(second).isEqual(to: expect, tolerance: tolerance))
    }
}

extension MKVectorTests {
    @Test("Rotate <Double>",
          arguments: [
              (MKVector<Double>(dx: 1, dy: 0), MKAngle<Double>(radians: 0.5 * .pi), MKVector<Double>(dx: 0, dy: 1)),
              (MKVector<Double>(dx: 2, dy: 0), MKAngle<Double>(radians: 0.5 * .pi), MKVector<Double>(dx: 0, dy: 2)),

              (MKVector<Double>(dx: 1, dy: 0), MKAngle<Double>(radians: .pi), MKVector<Double>(dx: -1, dy: 0)),
              (MKVector<Double>(dx: 2, dy: 0), MKAngle<Double>(radians: .pi), MKVector<Double>(dx: -2, dy: 0)),

              (MKVector<Double>(dx: 1, dy: 0), MKAngle<Double>(radians: 1.5 * .pi), MKVector<Double>(dx: 0, dy: -1)),
              (MKVector<Double>(dx: 2, dy: 0), MKAngle<Double>(radians: 1.5 * .pi), MKVector<Double>(dx: 0, dy: -2)),

              (MKVector<Double>(dx: 1, dy: 0), MKAngle<Double>(radians: 2 * .pi), MKVector<Double>(dx: 1, dy: 0)),
              (MKVector<Double>(dx: 2, dy: 0), MKAngle<Double>(radians: 2 * .pi), MKVector<Double>(dx: 2, dy: 0)),

              (MKVector<Double>(dx: 1, dy: 0), MKAngle<Double>(degrees: 45), MKVector<Double>(dx: 0.7071067811865475, dy: 0.7071067811865475)),
              (MKVector<Double>(dx: 2, dy: 0), MKAngle<Double>(degrees: 45), MKVector<Double>(dx: 1.414213562373095, dy: 1.414213562373095)),

              (MKVector<Double>(dx: 1, dy: 0), MKAngle<Double>(degrees: 60), MKVector<Double>(dx: 0.5, dy: 0.8660254037844386)),
              (MKVector<Double>(dx: 2, dy: 0), MKAngle<Double>(degrees: 60), MKVector<Double>(dx: 1, dy: 1.732050807568877)),
          ])
    func rotate_Double(_ args: (MKVector<Double>, MKAngle<Double>, MKVector<Double>)) {
        let (vec, angle, expect) = args

        #expect(
            vec.rotated(angle).isEqual(to: expect, tolerance: tolerance)
        )
    }

    @Test("Rotate <CGFloat>",
          arguments: [
              (MKVector<CGFloat>(dx: 1, dy: 0), MKAngle<CGFloat>(radians: 0.5 * .pi), MKVector<CGFloat>(dx: 0, dy: 1)),
              (MKVector<CGFloat>(dx: 2, dy: 0), MKAngle<CGFloat>(radians: 0.5 * .pi), MKVector<CGFloat>(dx: 0, dy: 2)),

              (MKVector<CGFloat>(dx: 1, dy: 0), MKAngle<CGFloat>(radians: .pi), MKVector<CGFloat>(dx: -1, dy: 0)),
              (MKVector<CGFloat>(dx: 2, dy: 0), MKAngle<CGFloat>(radians: .pi), MKVector<CGFloat>(dx: -2, dy: 0)),

              (MKVector<CGFloat>(dx: 1, dy: 0), MKAngle<CGFloat>(radians: 1.5 * .pi), MKVector<CGFloat>(dx: 0, dy: -1)),
              (MKVector<CGFloat>(dx: 2, dy: 0), MKAngle<CGFloat>(radians: 1.5 * .pi), MKVector<CGFloat>(dx: 0, dy: -2)),

              (MKVector<CGFloat>(dx: 1, dy: 0), MKAngle<CGFloat>(radians: 2 * .pi), MKVector<CGFloat>(dx: 1, dy: 0)),
              (MKVector<CGFloat>(dx: 2, dy: 0), MKAngle<CGFloat>(radians: 2 * .pi), MKVector<CGFloat>(dx: 2, dy: 0)),

              (MKVector<CGFloat>(dx: 1, dy: 0), MKAngle<CGFloat>(degrees: 45), MKVector<CGFloat>(dx: 0.7071067811865475, dy: 0.7071067811865475)),
              (MKVector<CGFloat>(dx: 2, dy: 0), MKAngle<CGFloat>(degrees: 45), MKVector<CGFloat>(dx: 1.414213562373095, dy: 1.414213562373095)),

              (MKVector<CGFloat>(dx: 1, dy: 0), MKAngle<CGFloat>(degrees: 60), MKVector<CGFloat>(dx: 0.5, dy: 0.8660254037844386)),
              (MKVector<CGFloat>(dx: 2, dy: 0), MKAngle<CGFloat>(degrees: 60), MKVector<CGFloat>(dx: 1, dy: 1.732050807568877)),
          ])
    func rotate_CGFloat(_ args: (MKVector<CGFloat>, MKAngle<CGFloat>, MKVector<CGFloat>)) {
        let (vec, angle, expect) = args

        #expect(
            vec.rotated(angle).isEqual(to: expect, tolerance: tolerance)
        )
    }

    @Test("Rotate <Float>",
          arguments: [
              (MKVector<Float>(dx: 1, dy: 0), MKAngle<Float>(radians: 0.5 * .pi), MKVector<Float>(dx: 0, dy: 1)),
              (MKVector<Float>(dx: 2, dy: 0), MKAngle<Float>(radians: 0.5 * .pi), MKVector<Float>(dx: 0, dy: 2)),

              (MKVector<Float>(dx: 1, dy: 0), MKAngle<Float>(radians: .pi), MKVector<Float>(dx: -1, dy: 0)),
              (MKVector<Float>(dx: 2, dy: 0), MKAngle<Float>(radians: .pi), MKVector<Float>(dx: -2, dy: 0)),

              (MKVector<Float>(dx: 1, dy: 0), MKAngle<Float>(radians: 1.5 * .pi), MKVector<Float>(dx: 0, dy: -1)),
              (MKVector<Float>(dx: 2, dy: 0), MKAngle<Float>(radians: 1.5 * .pi), MKVector<Float>(dx: 0, dy: -2)),

              (MKVector<Float>(dx: 1, dy: 0), MKAngle<Float>(radians: 2 * .pi), MKVector<Float>(dx: 1, dy: 0)),
              (MKVector<Float>(dx: 2, dy: 0), MKAngle<Float>(radians: 2 * .pi), MKVector<Float>(dx: 2, dy: 0)),

              (MKVector<Float>(dx: 1, dy: 0), MKAngle<Float>(degrees: 45), MKVector<Float>(dx: 0.7071067811865475, dy: 0.7071067811865475)),
              (MKVector<Float>(dx: 2, dy: 0), MKAngle<Float>(degrees: 45), MKVector<Float>(dx: 1.414213562373095, dy: 1.414213562373095)),

              (MKVector<Float>(dx: 1, dy: 0), MKAngle<Float>(degrees: 60), MKVector<Float>(dx: 0.5, dy: 0.8660254037844386)),
              (MKVector<Float>(dx: 2, dy: 0), MKAngle<Float>(degrees: 60), MKVector<Float>(dx: 1, dy: 1.732050807568877)),
          ])
    func rotate_Float(_ args: (MKVector<Float>, MKAngle<Float>, MKVector<Float>)) {
        let (vec, angle, expect) = args

        #expect(
            vec.rotated(angle).isEqual(to: expect, tolerance: halfTolerance)
        )
    }

    @Test("Rotate <Float16>",
          arguments: [
              (MKVector<Float16>(dx: 1, dy: 0), MKAngle<Float16>(radians: 0.5 * .pi), MKVector<Float16>(dx: 0, dy: 1)),
              (MKVector<Float16>(dx: 2, dy: 0), MKAngle<Float16>(radians: 0.5 * .pi), MKVector<Float16>(dx: 0, dy: 2)),

              (MKVector<Float16>(dx: 1, dy: 0), MKAngle<Float16>(radians: .pi), MKVector<Float16>(dx: -1, dy: 0)),
              (MKVector<Float16>(dx: 2, dy: 0), MKAngle<Float16>(radians: .pi), MKVector<Float16>(dx: -2, dy: 0)),

              (MKVector<Float16>(dx: 1, dy: 0), MKAngle<Float16>(radians: 1.5 * .pi), MKVector<Float16>(dx: 0, dy: -1)),
              (MKVector<Float16>(dx: 2, dy: 0), MKAngle<Float16>(radians: 1.5 * .pi), MKVector<Float16>(dx: 0, dy: -2)),

              (MKVector<Float16>(dx: 1, dy: 0), MKAngle<Float16>(radians: 2 * .pi), MKVector<Float16>(dx: 1, dy: 0)),
              (MKVector<Float16>(dx: 2, dy: 0), MKAngle<Float16>(radians: 2 * .pi), MKVector<Float16>(dx: 2, dy: 0)),

              (MKVector<Float16>(dx: 1, dy: 0), MKAngle<Float16>(degrees: 45), MKVector<Float16>(dx: 0.7071067811865475, dy: 0.7071067811865475)),
              (MKVector<Float16>(dx: 2, dy: 0), MKAngle<Float16>(degrees: 45), MKVector<Float16>(dx: 1.414213562373095, dy: 1.414213562373095)),

              (MKVector<Float16>(dx: 1, dy: 0), MKAngle<Float16>(degrees: 60), MKVector<Float16>(dx: 0.5, dy: 0.8660254037844386)),
              (MKVector<Float16>(dx: 2, dy: 0), MKAngle<Float16>(degrees: 60), MKVector<Float16>(dx: 1, dy: 1.732050807568877)),
          ])
    func rotate_Float16(_ args: (MKVector<Float16>, MKAngle<Float16>, MKVector<Float16>)) {
        let (vec, angle, expect) = args

        #expect(
            vec.rotated(angle).isEqual(to: expect, tolerance: lowTolerance)
        )
    }
}

#if canImport(CoreGraphics)

    import CoreGraphics

    extension MKVectorTests {
        @Test("Convert to CGVector")
        func convert() throws {
            let vector = MKVector<Double>(dx: 10.0, dy: 20.0)
            let cgVector = CGVector(CGPoint(x: 20.0, y: 10.0))

            #expect(CGVector(vector) == .init(dx: 10.0, dy: 20.0))
            #expect(MKVector(cgVector) == .init(dx: 20.0, dy: 10.0))
        }
    }

#endif // canImport(CoreGraphics)
