//
//  Created by Vitali Kurlovich on 04.04.2026.
//

#if os(macOS)

    import Foundation
    import MathKit
    import Testing

    private let tolerance: Double = 0.0000000001
    private let halfTolerance: Float32 = 0.0001
    private let lowTolerance: Float16 = 0.1

    @Suite("AffineTransform")
    struct AffineTransformTests {}

    extension AffineTransformTests {
        @Test("Constructor <Double>")
        func constructorDouble() throws {
            let tr = MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
            let affine = AffineTransform(tr)

            let conv = MKAffineTransform<Double>(affine)

            #expect(tr.isEqual(to: conv, tolerance: tolerance))
        }

        @Test("Constructor <CGFloat>")
        func constructorCGFloat() throws {
            let tr = MKAffineTransform<CGFloat>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
            let affine = AffineTransform(tr)

            let conv = MKAffineTransform<CGFloat>(affine)

            #expect(tr.isEqual(to: conv, tolerance: tolerance))
        }

        @Test("Constructor <Float>")
        func constructorFloat() throws {
            let tr = MKAffineTransform<Float>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
            let affine = AffineTransform(tr)

            let conv = MKAffineTransform<Float>(affine)

            #expect(tr.isEqual(to: conv, tolerance: halfTolerance))
        }

        @Test("Constructor <Float16>")
        func constructorFloat16() throws {
            let tr = MKAffineTransform<Float16>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
            let affine = AffineTransform(tr)

            let conv = MKAffineTransform<Float16>(affine)

            #expect(tr.isEqual(to: conv, tolerance: lowTolerance))
        }
    }

    @Suite("NSAffineTransform")
    struct NSAffineTransformTests {}

    extension NSAffineTransformTests {
        @Test("Constructor <Double>")
        func constructorDouble() throws {
            let tr = MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
            let affine = NSAffineTransform(tr)

            let conv = MKAffineTransform<Double>(affine)

            #expect(tr.isEqual(to: conv, tolerance: tolerance))
        }

        @Test("Constructor <CGFloat>")
        func constructorCGFloat() throws {
            let tr = MKAffineTransform<CGFloat>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
            let affine = NSAffineTransform(tr)

            let conv = MKAffineTransform<CGFloat>(affine)

            #expect(tr.isEqual(to: conv, tolerance: tolerance))
        }

        @Test("Constructor <Float>")
        func constructorFloat() throws {
            let tr = MKAffineTransform<Float>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
            let affine = NSAffineTransform(tr)

            let conv = MKAffineTransform<Float>(affine)

            #expect(tr.isEqual(to: conv, tolerance: halfTolerance))
        }

        @Test("Constructor <Float16>")
        func constructorFloat16() throws {
            let tr = MKAffineTransform<Float16>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
            let affine = NSAffineTransform(tr)

            let conv = MKAffineTransform<Float16>(affine)

            #expect(tr.isEqual(to: conv, tolerance: lowTolerance))
        }
    }

    @Suite("NSAffineTransformStruct")
    struct NSAffineTransformStructTests {}

    extension NSAffineTransformStructTests {
        @Test("Constructor <Double>")
        func constructorDouble() throws {
            let tr = MKAffineTransform<Double>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
            let affine = NSAffineTransformStruct(tr)

            let conv = MKAffineTransform<Double>(affine)

            #expect(tr.isEqual(to: conv, tolerance: tolerance))
        }

        @Test("Constructor <CGFloat>")
        func constructorCGFloat() throws {
            let tr = MKAffineTransform<CGFloat>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
            let affine = NSAffineTransformStruct(tr)

            let conv = MKAffineTransform<CGFloat>(affine)

            #expect(tr.isEqual(to: conv, tolerance: tolerance))
        }

        @Test("Constructor <Float>")
        func constructorFloat() throws {
            let tr = MKAffineTransform<Float>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
            let affine = NSAffineTransformStruct(tr)

            let conv = MKAffineTransform<Float>(affine)

            #expect(tr.isEqual(to: conv, tolerance: halfTolerance))
        }

        @Test("Constructor <Float16>")
        func constructorFloat16() throws {
            let tr = MKAffineTransform<Float16>(m11: 1, m12: 2, m21: 3, m22: 4, tx: 5, ty: 6)
            let affine = NSAffineTransformStruct(tr)

            let conv = MKAffineTransform<Float16>(affine)

            #expect(tr.isEqual(to: conv, tolerance: lowTolerance))
        }
    }

#endif
