//
//  Created by Kurlovich Vitali on 9/2/26.
//

import CGMathKit
import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.0000000001
private let halfTolerance: Float32 = 0.0001
private let lowTolerance: Float16 = 0.1

@Suite("CGSize")
struct CGSizeTests {}

extension CGSizeTests {
    @Test("Constructor <Double>")
    func constructorDouble() {
        let size = MKSize<Double>(width: 1, height: 2)
        let cg = CGSize(size)
        let conv = MKSize<Double>(cg)

        #expect(size.isEqual(to: conv, tolerance: tolerance))
    }

    @Test("Constructor <CGFloat>")
    func constructorCGFloat() {
        let size = MKSize<CGFloat>(width: 1, height: 2)
        let cg = CGSize(size)
        let conv = MKSize<CGFloat>(cg)

        #expect(size.isEqual(to: conv, tolerance: tolerance))
    }

    @Test("Constructor <Float>")
    func constructorFloat() {
        let size = MKSize<Float>(width: 1, height: 2)
        let cg = CGSize(size)
        let conv = MKSize<Float>(cg)

        #expect(size.isEqual(to: conv, tolerance: halfTolerance))
    }

    @Test("Constructor <Float16>")
    func constructorFloat16() {
        let size = MKSize<Float16>(width: 1, height: 2)
        let cg = CGSize(size)
        let conv = MKSize<Float16>(cg)

        #expect(size.isEqual(to: conv, tolerance: lowTolerance))
    }
}
