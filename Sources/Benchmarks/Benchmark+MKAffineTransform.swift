//
//  Benchmark+MKAffineTransform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 11.01.26.
//

import Benchmarks
import CoreGraphics
import MathKit

extension Benchmark {
    func runAffineBenchmark() {
        let benchmark = BenchmarkExecuter()

        benchmark.benchmark(name: "CGAffineTransform") { context in
            var acum: CGFloat = 0.0

            for _ in 0 ..< 10_000_000 {
                var affine = CGAffineTransform.identity
                // affine = affine.rotated(by: 45 * .pi / 180)
                affine = affine.translatedBy(x: 20, y: 30)
                affine = affine.scaledBy(x: 4, y: 5)

                // affine = affine.rotated(by: 45 * .pi / 180)

                affine = affine.translatedBy(x: 20, y: 30)
                // affine = affine.rotated(by: -45 * .pi / 180)

                let p = CGPoint(x: 10, y: 20).applying(affine)

                acum += (p.x + p.y)
            }

            context.blackHole(acum)
        }

        benchmark.benchmark(name: "MKAffineTransform") { context in
            var acum: CGFloat = 0.0

            for _ in 0 ..< 10_000_000 {
                var affine = MKAffineTransform<CGFloat>.identity
                // affine.rotate(.degrees(45))
                affine.translate(x: 20, y: 30)
                affine.scale(x: 4, y: 5)
                // affine.rotate(.degrees(45))
                affine.translate(x: 4, y: 3)
                // affine.rotate(.degrees(-45))
                let p = affine.transform(MKPoint(x: 10, y: 20))

                acum += (p.x + p.y)
            }

            context.blackHole(acum)
        }

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

        benchmark.benchmark(name: "MKAffineTransform mul") { context in
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

        benchmark.start()
    }

    func runAffineInverseBenchmark() {
        let benchmark = BenchmarkExecuter()

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
}
