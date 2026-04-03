//
//  Created by Vitali Kurlovich on 03.04.2026.
//

import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.000001
private let halfTolerance: Float32 = 0.0001
private let lowTolerance: Float16 = 0.1

@Suite("MKVectorComponents")
struct MKVectorComponentsTests {}

extension MKVectorComponentsTests {
    @Test("Init <Double>", arguments: [
        (MKVectorComponents<Double>(magnitude: 1, rotation: .zero), MKVector<Double>(dx: 1, dy: 0)),
        (MKVectorComponents<Double>(magnitude: 2, rotation: .zero), MKVector<Double>(dx: 2, dy: 0)),

        (MKVectorComponents<Double>(magnitude: 1, rotation: .radians(0.5 * .pi)), MKVector<Double>(dx: 0, dy: 1)),
        (MKVectorComponents<Double>(magnitude: 2, rotation: .radians(0.5 * .pi)), MKVector<Double>(dx: 0, dy: 2)),

        (MKVectorComponents<Double>(magnitude: 1, rotation: .radians(.pi)), MKVector<Double>(dx: -1, dy: 0)),
        (MKVectorComponents<Double>(magnitude: 2, rotation: .radians(.pi)), MKVector<Double>(dx: -2, dy: 0)),

        (MKVectorComponents<Double>(magnitude: 1, rotation: .radians(1.5 * .pi)), MKVector<Double>(dx: 0, dy: -1)),
        (MKVectorComponents<Double>(magnitude: 2, rotation: .radians(1.5 * .pi)), MKVector<Double>(dx: 0, dy: -2)),

        (MKVectorComponents<Double>(magnitude: 1, rotation: .radians(-0.5 * .pi)), MKVector<Double>(dx: 0, dy: -1)),
        (MKVectorComponents<Double>(magnitude: 2, rotation: .radians(-0.5 * .pi)), MKVector<Double>(dx: 0, dy: -2)),

        (MKVectorComponents<Double>(magnitude: 1, rotation: .radians(2 * .pi)), MKVector<Double>(dx: 1, dy: 0)),
        (MKVectorComponents<Double>(magnitude: 2, rotation: .radians(2 * .pi)), MKVector<Double>(dx: 2, dy: 0)),

        (MKVectorComponents<Double>(magnitude: 1, rotation: .degrees(45)), MKVector<Double>(dx: 0.7071067811865475, dy: 0.7071067811865475)),
        (MKVectorComponents<Double>(magnitude: 2, rotation: .degrees(45)), MKVector<Double>(dx: 1.414213562373095, dy: 1.414213562373095)),

        (MKVectorComponents<Double>(magnitude: 1, rotation: .degrees(60)), MKVector<Double>(dx: 0.5, dy: 0.8660254037844386)),
        (MKVectorComponents<Double>(magnitude: 2, rotation: .degrees(60)), MKVector<Double>(dx: 1, dy: 1.732050807568877)),
    ])
    func initDouble(_ args: (MKVectorComponents<Double>, MKVector<Double>)) {
        let (comps, expect) = args

        #expect(MKVector(comps).isEqual(to: expect, tolerance: tolerance))
    }

    @Test("Init <Float>", arguments: [
        (MKVectorComponents<Float>(magnitude: 1, rotation: .zero), MKVector<Float>(dx: 1, dy: 0)),
        (MKVectorComponents<Float>(magnitude: 2, rotation: .zero), MKVector<Float>(dx: 2, dy: 0)),

        (MKVectorComponents<Float>(magnitude: 1, rotation: .radians(0.5 * .pi)), MKVector<Float>(dx: 0, dy: 1)),
        (MKVectorComponents<Float>(magnitude: 2, rotation: .radians(0.5 * .pi)), MKVector<Float>(dx: 0, dy: 2)),

        (MKVectorComponents<Float>(magnitude: 1, rotation: .radians(.pi)), MKVector<Float>(dx: -1, dy: 0)),
        (MKVectorComponents<Float>(magnitude: 2, rotation: .radians(.pi)), MKVector<Float>(dx: -2, dy: 0)),

        (MKVectorComponents<Float>(magnitude: 1, rotation: .radians(1.5 * .pi)), MKVector<Float>(dx: 0, dy: -1)),
        (MKVectorComponents<Float>(magnitude: 2, rotation: .radians(1.5 * .pi)), MKVector<Float>(dx: 0, dy: -2)),

        (MKVectorComponents<Float>(magnitude: 1, rotation: .radians(-0.5 * .pi)), MKVector<Float>(dx: 0, dy: -1)),
        (MKVectorComponents<Float>(magnitude: 2, rotation: .radians(-0.5 * .pi)), MKVector<Float>(dx: 0, dy: -2)),

        (MKVectorComponents<Float>(magnitude: 1, rotation: .radians(2 * .pi)), MKVector<Float>(dx: 1, dy: 0)),
        (MKVectorComponents<Float>(magnitude: 2, rotation: .radians(2 * .pi)), MKVector<Float>(dx: 2, dy: 0)),

        (MKVectorComponents<Float>(magnitude: 1, rotation: .degrees(45)), MKVector<Float>(dx: 0.7071067811865475, dy: 0.7071067811865475)),
        (MKVectorComponents<Float>(magnitude: 2, rotation: .degrees(45)), MKVector<Float>(dx: 1.414213562373095, dy: 1.414213562373095)),

        (MKVectorComponents<Float>(magnitude: 1, rotation: .degrees(60)), MKVector<Float>(dx: 0.5, dy: 0.8660254037844386)),
        (MKVectorComponents<Float>(magnitude: 2, rotation: .degrees(60)), MKVector<Float>(dx: 1, dy: 1.732050807568877)),
    ])
    func initFloat(_ args: (MKVectorComponents<Float>, MKVector<Float>)) {
        let (comps, expect) = args

        #expect(MKVector(comps).isEqual(to: expect, tolerance: halfTolerance))
    }

    @Test("Init <CGFloat>", arguments: [
        (MKVectorComponents<CGFloat>(magnitude: 1, rotation: .zero), MKVector<CGFloat>(dx: 1, dy: 0)),
        (MKVectorComponents<CGFloat>(magnitude: 2, rotation: .zero), MKVector<CGFloat>(dx: 2, dy: 0)),

        (MKVectorComponents<CGFloat>(magnitude: 1, rotation: .radians(0.5 * .pi)), MKVector<CGFloat>(dx: 0, dy: 1)),
        (MKVectorComponents<CGFloat>(magnitude: 2, rotation: .radians(0.5 * .pi)), MKVector<CGFloat>(dx: 0, dy: 2)),

        (MKVectorComponents<CGFloat>(magnitude: 1, rotation: .radians(.pi)), MKVector<CGFloat>(dx: -1, dy: 0)),
        (MKVectorComponents<CGFloat>(magnitude: 2, rotation: .radians(.pi)), MKVector<CGFloat>(dx: -2, dy: 0)),

        (MKVectorComponents<CGFloat>(magnitude: 1, rotation: .radians(1.5 * .pi)), MKVector<CGFloat>(dx: 0, dy: -1)),
        (MKVectorComponents<CGFloat>(magnitude: 2, rotation: .radians(1.5 * .pi)), MKVector<CGFloat>(dx: 0, dy: -2)),

        (MKVectorComponents<CGFloat>(magnitude: 1, rotation: .radians(-0.5 * .pi)), MKVector<CGFloat>(dx: 0, dy: -1)),
        (MKVectorComponents<CGFloat>(magnitude: 2, rotation: .radians(-0.5 * .pi)), MKVector<CGFloat>(dx: 0, dy: -2)),

        (MKVectorComponents<CGFloat>(magnitude: 1, rotation: .radians(2 * .pi)), MKVector<CGFloat>(dx: 1, dy: 0)),
        (MKVectorComponents<CGFloat>(magnitude: 2, rotation: .radians(2 * .pi)), MKVector<CGFloat>(dx: 2, dy: 0)),

        (MKVectorComponents<CGFloat>(magnitude: 1, rotation: .degrees(45)), MKVector<CGFloat>(dx: 0.7071067811865475, dy: 0.7071067811865475)),
        (MKVectorComponents<CGFloat>(magnitude: 2, rotation: .degrees(45)), MKVector<CGFloat>(dx: 1.414213562373095, dy: 1.414213562373095)),

        (MKVectorComponents<CGFloat>(magnitude: 1, rotation: .degrees(60)), MKVector<CGFloat>(dx: 0.5, dy: 0.8660254037844386)),
        (MKVectorComponents<CGFloat>(magnitude: 2, rotation: .degrees(60)), MKVector<CGFloat>(dx: 1, dy: 1.732050807568877)),
    ])
    func initCGFloat(_ args: (MKVectorComponents<CGFloat>, MKVector<CGFloat>)) {
        let (comps, expect) = args

        #expect(MKVector(comps).isEqual(to: expect, tolerance: tolerance))
    }

    @Test("Init <Float16>", arguments: [
        (MKVectorComponents<Float16>(magnitude: 1, rotation: .zero), MKVector<Float16>(dx: 1, dy: 0)),
        (MKVectorComponents<Float16>(magnitude: 2, rotation: .zero), MKVector<Float16>(dx: 2, dy: 0)),

        (MKVectorComponents<Float16>(magnitude: 1, rotation: .radians(0.5 * .pi)), MKVector<Float16>(dx: 0, dy: 1)),
        (MKVectorComponents<Float16>(magnitude: 2, rotation: .radians(0.5 * .pi)), MKVector<Float16>(dx: 0, dy: 2)),

        (MKVectorComponents<Float16>(magnitude: 1, rotation: .radians(.pi)), MKVector<Float16>(dx: -1, dy: 0)),
        (MKVectorComponents<Float16>(magnitude: 2, rotation: .radians(.pi)), MKVector<Float16>(dx: -2, dy: 0)),

        (MKVectorComponents<Float16>(magnitude: 1, rotation: .radians(1.5 * .pi)), MKVector<Float16>(dx: 0, dy: -1)),
        (MKVectorComponents<Float16>(magnitude: 2, rotation: .radians(1.5 * .pi)), MKVector<Float16>(dx: 0, dy: -2)),

        (MKVectorComponents<Float16>(magnitude: 1, rotation: .radians(-0.5 * .pi)), MKVector<Float16>(dx: 0, dy: -1)),
        (MKVectorComponents<Float16>(magnitude: 2, rotation: .radians(-0.5 * .pi)), MKVector<Float16>(dx: 0, dy: -2)),

        (MKVectorComponents<Float16>(magnitude: 1, rotation: .radians(2 * .pi)), MKVector<Float16>(dx: 1, dy: 0)),
        (MKVectorComponents<Float16>(magnitude: 2, rotation: .radians(2 * .pi)), MKVector<Float16>(dx: 2, dy: 0)),

        (MKVectorComponents<Float16>(magnitude: 1, rotation: .degrees(45)), MKVector<Float16>(dx: 0.7071067811865475, dy: 0.7071067811865475)),
        (MKVectorComponents<Float16>(magnitude: 2, rotation: .degrees(45)), MKVector<Float16>(dx: 1.414213562373095, dy: 1.414213562373095)),

        (MKVectorComponents<Float16>(magnitude: 1, rotation: .degrees(60)), MKVector<Float16>(dx: 0.5, dy: 0.8660254037844386)),
        (MKVectorComponents<Float16>(magnitude: 2, rotation: .degrees(60)), MKVector<Float16>(dx: 1, dy: 1.732050807568877)),
    ])
    func initFloat16(_ args: (MKVectorComponents<Float16>, MKVector<Float16>)) {
        let (comps, expect) = args

        #expect(MKVector(comps).isEqual(to: expect, tolerance: lowTolerance))
    }
}

extension MKVectorComponentsTests {
    @Test("Decomposed <Double>", arguments: [
        (MKVectorComponents<Double>(magnitude: 1, rotation: .zero), MKVector<Double>(dx: 1, dy: 0)),
        (MKVectorComponents<Double>(magnitude: 2, rotation: .zero), MKVector<Double>(dx: 2, dy: 0)),

        (MKVectorComponents<Double>(magnitude: 1, rotation: .radians(0.5 * .pi)), MKVector<Double>(dx: 0, dy: 1)),
        (MKVectorComponents<Double>(magnitude: 2, rotation: .radians(0.5 * .pi)), MKVector<Double>(dx: 0, dy: 2)),

        (MKVectorComponents<Double>(magnitude: 1, rotation: .radians(.pi)), MKVector<Double>(dx: -1, dy: 0)),
        (MKVectorComponents<Double>(magnitude: 2, rotation: .radians(.pi)), MKVector<Double>(dx: -2, dy: 0)),

        (MKVectorComponents<Double>(magnitude: 1, rotation: .radians(-0.5 * .pi)), MKVector<Double>(dx: 0, dy: -1)),
        (MKVectorComponents<Double>(magnitude: 2, rotation: .radians(-0.5 * .pi)), MKVector<Double>(dx: 0, dy: -2)),

        (MKVectorComponents<Double>(magnitude: 1, rotation: .degrees(45)), MKVector<Double>(dx: 0.7071067811865475, dy: 0.7071067811865475)),
        (MKVectorComponents<Double>(magnitude: 2, rotation: .degrees(45)), MKVector<Double>(dx: 1.414213562373095, dy: 1.414213562373095)),

        (MKVectorComponents<Double>(magnitude: 1, rotation: .degrees(60)), MKVector<Double>(dx: 0.5, dy: 0.8660254037844386)),
        (MKVectorComponents<Double>(magnitude: 2, rotation: .degrees(60)), MKVector<Double>(dx: 1, dy: 1.732050807568877)),
    ])
    func decomposeDouble(_ args: (MKVectorComponents<Double>, MKVector<Double>)) {
        let (comps, vec) = args

        #expect(vec.decomposed().isEqual(to: comps, tolerance: tolerance))
    }

    @Test("Decomposed <CGFloat>", arguments: [
        (MKVectorComponents<CGFloat>(magnitude: 1, rotation: .zero), MKVector<CGFloat>(dx: 1, dy: 0)),
        (MKVectorComponents<CGFloat>(magnitude: 2, rotation: .zero), MKVector<CGFloat>(dx: 2, dy: 0)),

        (MKVectorComponents<CGFloat>(magnitude: 1, rotation: .radians(0.5 * .pi)), MKVector<CGFloat>(dx: 0, dy: 1)),
        (MKVectorComponents<CGFloat>(magnitude: 2, rotation: .radians(0.5 * .pi)), MKVector<CGFloat>(dx: 0, dy: 2)),

        (MKVectorComponents<CGFloat>(magnitude: 1, rotation: .radians(.pi)), MKVector<CGFloat>(dx: -1, dy: 0)),
        (MKVectorComponents<CGFloat>(magnitude: 2, rotation: .radians(.pi)), MKVector<CGFloat>(dx: -2, dy: 0)),

        (MKVectorComponents<CGFloat>(magnitude: 1, rotation: .radians(-0.5 * .pi)), MKVector<CGFloat>(dx: 0, dy: -1)),
        (MKVectorComponents<CGFloat>(magnitude: 2, rotation: .radians(-0.5 * .pi)), MKVector<CGFloat>(dx: 0, dy: -2)),

        (MKVectorComponents<CGFloat>(magnitude: 1, rotation: .degrees(45)), MKVector<CGFloat>(dx: 0.7071067811865475, dy: 0.7071067811865475)),
        (MKVectorComponents<CGFloat>(magnitude: 2, rotation: .degrees(45)), MKVector<CGFloat>(dx: 1.414213562373095, dy: 1.414213562373095)),

        (MKVectorComponents<CGFloat>(magnitude: 1, rotation: .degrees(60)), MKVector<CGFloat>(dx: 0.5, dy: 0.8660254037844386)),
        (MKVectorComponents<CGFloat>(magnitude: 2, rotation: .degrees(60)), MKVector<CGFloat>(dx: 1, dy: 1.732050807568877)),
    ])
    func decomposeCGFloat(_ args: (MKVectorComponents<CGFloat>, MKVector<CGFloat>)) {
        let (comps, vec) = args

        #expect(vec.decomposed().isEqual(to: comps, tolerance: tolerance))
    }

    @Test("Decomposed <Float>", arguments: [
        (MKVectorComponents<Float>(magnitude: 1, rotation: .zero), MKVector<Float>(dx: 1, dy: 0)),
        (MKVectorComponents<Float>(magnitude: 2, rotation: .zero), MKVector<Float>(dx: 2, dy: 0)),

        (MKVectorComponents<Float>(magnitude: 1, rotation: .radians(0.5 * .pi)), MKVector<Float>(dx: 0, dy: 1)),
        (MKVectorComponents<Float>(magnitude: 2, rotation: .radians(0.5 * .pi)), MKVector<Float>(dx: 0, dy: 2)),

        (MKVectorComponents<Float>(magnitude: 1, rotation: .radians(.pi)), MKVector<Float>(dx: -1, dy: 0)),
        (MKVectorComponents<Float>(magnitude: 2, rotation: .radians(.pi)), MKVector<Float>(dx: -2, dy: 0)),

        (MKVectorComponents<Float>(magnitude: 1, rotation: .radians(-0.5 * .pi)), MKVector<Float>(dx: 0, dy: -1)),
        (MKVectorComponents<Float>(magnitude: 2, rotation: .radians(-0.5 * .pi)), MKVector<Float>(dx: 0, dy: -2)),

        (MKVectorComponents<Float>(magnitude: 1, rotation: .degrees(45)), MKVector<Float>(dx: 0.7071067811865475, dy: 0.7071067811865475)),
        (MKVectorComponents<Float>(magnitude: 2, rotation: .degrees(45)), MKVector<Float>(dx: 1.414213562373095, dy: 1.414213562373095)),

        (MKVectorComponents<Float>(magnitude: 1, rotation: .degrees(60)), MKVector<Float>(dx: 0.5, dy: 0.8660254037844386)),
        (MKVectorComponents<Float>(magnitude: 2, rotation: .degrees(60)), MKVector<Float>(dx: 1, dy: 1.732050807568877)),
    ])
    func decomposeFloat(_ args: (MKVectorComponents<Float>, MKVector<Float>)) {
        let (comps, vec) = args

        #expect(vec.decomposed().isEqual(to: comps, tolerance: halfTolerance))
    }

    @Test("Decomposed <Float16>", arguments: [
        (MKVectorComponents<Float16>(magnitude: 1, rotation: .zero), MKVector<Float16>(dx: 1, dy: 0)),
        (MKVectorComponents<Float16>(magnitude: 2, rotation: .zero), MKVector<Float16>(dx: 2, dy: 0)),

        (MKVectorComponents<Float16>(magnitude: 1, rotation: .radians(0.5 * .pi)), MKVector<Float16>(dx: 0, dy: 1)),
        (MKVectorComponents<Float16>(magnitude: 2, rotation: .radians(0.5 * .pi)), MKVector<Float16>(dx: 0, dy: 2)),

        (MKVectorComponents<Float16>(magnitude: 1, rotation: .radians(.pi)), MKVector<Float16>(dx: -1, dy: 0)),
        (MKVectorComponents<Float16>(magnitude: 2, rotation: .radians(.pi)), MKVector<Float16>(dx: -2, dy: 0)),

        (MKVectorComponents<Float16>(magnitude: 1, rotation: .radians(-0.5 * .pi)), MKVector<Float16>(dx: 0, dy: -1)),
        (MKVectorComponents<Float16>(magnitude: 2, rotation: .radians(-0.5 * .pi)), MKVector<Float16>(dx: 0, dy: -2)),

        (MKVectorComponents<Float16>(magnitude: 1, rotation: .degrees(45)), MKVector<Float16>(dx: 0.7071067811865475, dy: 0.7071067811865475)),
        (MKVectorComponents<Float16>(magnitude: 2, rotation: .degrees(45)), MKVector<Float16>(dx: 1.414213562373095, dy: 1.414213562373095)),

        (MKVectorComponents<Float16>(magnitude: 1, rotation: .degrees(60)), MKVector<Float16>(dx: 0.5, dy: 0.8660254037844386)),
        (MKVectorComponents<Float16>(magnitude: 2, rotation: .degrees(60)), MKVector<Float16>(dx: 1, dy: 1.732050807568877)),
    ])
    func decomposeFloat16(_ args: (MKVectorComponents<Float16>, MKVector<Float16>)) {
        let (comps, vec) = args

        #expect(vec.decomposed().isEqual(to: comps, tolerance: lowTolerance))
    }
}
