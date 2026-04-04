//
//  Created by Vitali Kurlovich on 02.04.2026.
//

import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.0000000001
private let halfTolerance: Float32 = 0.0001
private let lowTolerance: Float16 = 0.1

@Suite("MKSize")
struct MKSizeTests {}

extension MKSizeTests {
    @Test("Constructor <Double>")
    func constructorDouble() throws {
        let size = MKSize<Double>(width: 1, height: 2)
        let cg = CGSize(size)
        let conv = MKSize<Double>(cg)

        #expect(size.isEqual(to: conv, tolerance: tolerance))
    }

    @Test("Constructor <CGFloat>")
    func constructorCGFloat() throws {
        let size = MKSize<CGFloat>(width: 1, height: 2)
        let cg = CGSize(size)
        let conv = MKSize<CGFloat>(cg)

        #expect(size.isEqual(to: conv, tolerance: tolerance))
    }

    @Test("Constructor <Float>")
    func constructorFloat() throws {
        let size = MKSize<Float>(width: 1, height: 2)
        let cg = CGSize(size)
        let conv = MKSize<Float>(cg)

        #expect(size.isEqual(to: conv, tolerance: halfTolerance))
    }

    @Test("Constructor <Float16>")
    func constructorFloat16() throws {
        let size = MKSize<Float16>(width: 1, height: 2)
        let cg = CGSize(size)
        let conv = MKSize<Float16>(cg)

        #expect(size.isEqual(to: conv, tolerance: lowTolerance))
    }
}

extension MKSizeTests {
    @Test("Zero")
    func zero() throws {
        let size = MKSize<Double>.zero

        #expect(size.width == 0)
        #expect(size.height == 0)
    }

    @Test("Identity")
    func identity() throws {
        let size = MKSize<Double>.identity

        #expect(size.width == 1)
        #expect(size.height == 1)
    }

    @Test("aspectRatio")
    func aspectRatio() throws {
        #expect(MKSize<Double>.identity.aspectRatio.isEqual(to: 1, tolerance: tolerance))

        #expect(MKSize<Double>(width: 2, height: 1).aspectRatio.isEqual(to: 2, tolerance: tolerance))
        #expect(MKSize<Double>(width: 2, height: 4).aspectRatio.isEqual(to: 0.5, tolerance: tolerance))
    }

    @Test("Multiply")
    func mul() throws {
        var size = MKSize<Double>(width: 2, height: 3) * 2

        #expect(size.isEqual(to: .init(width: 4, height: 6), tolerance: tolerance))

        size *= 3

        #expect(size.isEqual(to: .init(width: 12, height: 18), tolerance: tolerance))

        size *= MKSize<Double>(width: 10, height: 20)

        #expect(size.isEqual(to: .init(width: 120, height: 360), tolerance: tolerance))

        #expect((0.5 * size).isEqual(to: .init(width: 60, height: 180), tolerance: tolerance))
    }

    @Test("Divide")
    func div() throws {
        var size = MKSize<Double>(width: 20, height: 30) / 2

        #expect(size.isEqual(to: .init(width: 10, height: 15), tolerance: tolerance))

        size /= 5

        #expect(size.isEqual(to: .init(width: 2, height: 3), tolerance: tolerance))

        size /= MKSize<Double>(width: 4, height: 2)

        #expect(size.isEqual(to: .init(width: 0.5, height: 1.5), tolerance: tolerance))
    }
}
