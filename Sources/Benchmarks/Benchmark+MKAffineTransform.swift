//
//  Benchmark+MKAffineTransform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 11.01.26.
//

import Benchmarks
import Foundation
import MathKit
#if canImport(CoreGraphics)
    import CoreGraphics

#endif

extension Benchmark {
    func runAffineBenchmark() {
        let benchmark = BenchmarkExecuter()
        #if canImport(CoreGraphics)
            benchmark.benchmark(name: "CGAffineTransform") { context in
                var acum: CGFloat = 0.0

                for _ in 0 ..< 10_000_000 {
                    var affine = CGAffineTransform.identity
                    affine = affine.rotated(by: acum * .pi / 180)
                    affine = affine.translatedBy(x: 20, y: 30)
                    affine = affine.scaledBy(x: 4, y: 5)

                    affine = affine.rotated(by: acum * .pi / 180)

                    affine = affine.translatedBy(x: 20, y: 30)
                    affine = affine.rotated(by: acum * .pi / 180)

                    acum += affine.determinant
                }

                context.blackHole(acum)
            }
        #endif // canImport(CoreGraphics)

        benchmark.benchmark(name: "MKAffineTransform (CGFloat)") { context in
            var acum: CGFloat = 0.0

            for _ in 0 ..< 10_000_000 {
                var affine = MKAffineTransform<CGFloat>.identity
                affine.rotate(.degrees(acum))
                affine.translate(x: 20, y: 30)
                affine.scale(x: 4, y: 5)

                affine.rotate(.degrees(acum))

                affine.translate(x: 4, y: 3)
                affine.rotate(.degrees(acum))

                acum += affine.determinant
            }

            context.blackHole(acum)
        }

        benchmark.benchmark(name: "MKAffineTransform (Float16)") { context in
            var acum: Float16 = 0.0

            for _ in 0 ..< 10_000_000 {
                var affine = MKAffineTransform<Float16>.identity
                affine.rotate(.degrees(acum))
                affine.translate(x: 20, y: 30)
                affine.scale(x: 4, y: 5)

                affine.rotate(.degrees(acum))

                affine.translate(x: 4, y: 3)
                affine.rotate(.degrees(acum))

                acum += affine.determinant
            }

            context.blackHole(acum)
        }

        #if canImport(CoreGraphics)
            benchmark.benchmark(name: "CGAffineTransform mul") { context in
                var acum: CGFloat = 0.0

                let translation = CGAffineTransform(translationX: 20, y: 30)
                let scale = CGAffineTransform(scaleX: 4, y: 3)
                let rotate = CGAffineTransform(rotationAngle: 45 * .pi / 180)

                for _ in 0 ..< 10_000_000 {
                    var affine = CGAffineTransform.identity
                    affine = affine.concatenating(translation)
                    affine = affine.concatenating(scale)
                    affine = affine.concatenating(rotate)

                    let p = CGPoint(x: 10, y: 20).applying(affine)

                    acum += (p.x + p.y)
                }

                context.blackHole(acum)
            }
        #endif // canImport(CoreGraphics)

        benchmark.benchmark(name: "MKAffineTransform mul (Double)") { context in
            var acum = 0.0

            let translation = MKAffineTransform<Double>(translationByX: 20, byY: 30)
            let scale = MKAffineTransform<Double>(scaleByX: 4, byY: 3)
            let rotate = MKAffineTransform<Double>(.degrees(45))

            for _ in 0 ..< 10_000_000 {
                var affine = MKAffineTransform<Double>.identity
                affine.append(translation)
                affine.append(scale)
                affine.append(rotate)

                let p = affine.transform(MKPoint(x: 10, y: 20))

                acum += (p.x + p.y)
            }

            context.blackHole(acum)
        }

        benchmark.benchmark(name: "MKAffineTransform mul (CGFloat)") { context in
            var acum: CGFloat = 0.0

            let translation = MKAffineTransform<CGFloat>(translationByX: 20, byY: 30)
            let scale = MKAffineTransform<CGFloat>(scaleByX: 4, byY: 3)
            let rotate = MKAffineTransform<CGFloat>(.degrees(45))

            for _ in 0 ..< 10_000_000 {
                var affine = MKAffineTransform<CGFloat>.identity
                affine.append(translation)
                affine.append(scale)
                affine.append(rotate)

                let p = affine.transform(MKPoint(x: 10, y: 20))

                acum += (p.x + p.y)
            }

            context.blackHole(acum)
        }

        benchmark.benchmark(name: "MKAffineTransform mul (Float16)") { context in
            var acum: Float16 = 0.0

            let translation = MKAffineTransform<Float16>(translationByX: 20, byY: 30)
            let scale = MKAffineTransform<Float16>(scaleByX: 4, byY: 3)
            let rotate = MKAffineTransform<Float16>(.degrees(45))

            for _ in 0 ..< 10_000_000 {
                var affine = MKAffineTransform<Float16>.identity
                affine.append(translation)
                affine.append(scale)
                affine.append(rotate)

                let p = affine.transform(MKPoint(x: 10, y: 20))

                acum += (p.x + p.y)
            }

            context.blackHole(acum)
        }

        benchmark.start()
    }

    func runAffineInverseBenchmark() {
        let benchmark = BenchmarkExecuter()
        #if canImport(CoreGraphics)
            benchmark.benchmark(name: "CGAffineTransform inverted") { context in
                var acum: CGFloat = 0.0

                let translation = CGAffineTransform(translationX: 20, y: 30)
                let scale = CGAffineTransform(scaleX: 4, y: 3)
                let rotate = CGAffineTransform(rotationAngle: 45 * .pi / 180)

                var affine = CGAffineTransform.identity
                affine = affine.concatenating(translation)
                affine = affine.concatenating(scale)
                affine = affine.concatenating(rotate)

                for _ in 0 ..< 10_000_000 {
                    affine = affine.inverted()

                    let p = CGPoint(x: 10, y: 20).applying(affine)

                    acum += (p.x + p.y)
                }

                context.blackHole(acum)
            }
        #endif // canImport(CoreGraphics)
        benchmark.benchmark(name: "MKAffineTransform inverse") { context in
            var acum: CGFloat = 0.0

            let translation = MKAffineTransform<CGFloat>(translationByX: 20, byY: 30)
            let scale = MKAffineTransform<CGFloat>(scaleByX: 4, byY: 3)
            let rotate = MKAffineTransform<CGFloat>(.degrees(45))

            var affine = MKAffineTransform<CGFloat>.identity
            affine.append(translation)
            affine.append(scale)
            affine.append(rotate)

            for _ in 0 ..< 10_000_000 {
                let p = affine.inverse(MKPoint(x: 10, y: 20))

                acum += (p.x + p.y)
            }

            context.blackHole(acum)
        }

        benchmark.start()
    }

    func runAffineRotateBenchmark() {
        let benchmark = BenchmarkExecuter()
        #if canImport(CoreGraphics)
            benchmark.benchmark(name: "CGAffineTransform rotate") { context in
                var acum = 0.0

                var affine = CGAffineTransform.identity

                for _ in 0 ..< 10_000_000 {
                    affine = affine.rotated(by: acum * (.pi / 180))
                    acum += affine.determinant
                }

                context.blackHole(acum)
            }
        #endif // canImport(CoreGraphics)
        benchmark.benchmark(name: "MKAffineTransform rotate (Double)") { context in
            var acum = 0.0

            var affine = MKAffineTransform<Double>.identity

            for _ in 0 ..< 10_000_000 {
                affine.rotate(.degrees(acum))
                acum += affine.determinant
            }

            context.blackHole(acum)
        }

        benchmark.benchmark(name: "MKAffineTransform rotate simd (CGFloat)") { context in
            var acum: CGFloat = 0.0

            var affine = MKAffineTransform<CGFloat>.identity

            for _ in 0 ..< 10_000_000 {
                affine.rotate(.degrees(acum))
                acum += affine.determinant
            }

            context.blackHole(acum)
        }

        benchmark.benchmark(name: "MKAffineTransform rotate simd (Float16)") { context in
            var acum: Float16 = 0.0

            var affine = MKAffineTransform<Float16>.identity

            for _ in 0 ..< 10_000_000 {
                affine.rotate(.degrees(acum))
                acum += affine.determinant
            }

            context.blackHole(acum)
        }

        benchmark.start()
    }
}

#if canImport(CoreGraphics)

    extension CGAffineTransform {
        var determinant: CGFloat {
            (a * d).addingProduct(-b, c)
        }
    }

#endif // canImport(CoreGraphics)
