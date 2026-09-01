//
//  CGRectTests.swift
//  swift-mathkit
//
//  Created by Kurlovich Vitali on 9/1/26.
//

import CGMathKit
import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.0000000001
private let halfTolerance: Float32 = 0.0001
private let lowTolerance: Float16 = 0.1

@Suite("CGRect")
struct CGRectTests {}

extension CGRectTests {
    @Test("Constructor <Double>")
    func constructorDouble() {
        let rect = MKRect<Double>(x: 1, y: 2, width: 3, height: 4)
        let cg = CGRect(rect)
        let conv = MKRect<Double>(cg)

        #expect(rect.isEqual(to: conv, tolerance: tolerance))
    }

    @Test("Constructor <CGFloat>")
    func constructorCGFloat() {
        let rect = MKRect<CGFloat>(x: 1, y: 2, width: 3, height: 4)
        let cg = CGRect(rect)
        let conv = MKRect<CGFloat>(cg)

        #expect(rect.isEqual(to: conv, tolerance: tolerance))
    }

    @Test("Constructor <Float>")
    func constructorFloat() {
        let rect = MKRect<Float>(x: 1, y: 2, width: 3, height: 4)
        let cg = CGRect(rect)
        let conv = MKRect<Float>(cg)

        #expect(rect.isEqual(to: conv, tolerance: halfTolerance))
    }

    @Test("Constructor <Float16>")
    func constructorFloat16() {
        let rect = MKRect<Float16>(x: 1, y: 2, width: 3, height: 4)
        let cg = CGRect(rect)
        let conv = MKRect<Float16>(cg)

        #expect(rect.isEqual(to: conv, tolerance: lowTolerance))
    }
}
