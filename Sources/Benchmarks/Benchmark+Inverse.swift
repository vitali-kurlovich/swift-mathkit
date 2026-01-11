//
//  Benchmark+Inverse.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 25.12.25.
//

import Benchmarks
import MathKit

import Foundation

extension Benchmark {
    func runInverseBenchmark() {
        let benchmark = BenchmarkExecuter()

        benchmark.benchmark(name: "Inverse") { context in
            var acum = 0.0

            let p0 = MKPoint<CGFloat>(x: -10, y: -20)
            let p1 = MKPoint<CGFloat>(x: 10, y: -10)
            let p2 = MKPoint<CGFloat>(x: 15, y: 20)
            let p3 = MKPoint<CGFloat>(x: -20, y: 15)

            let p = MKPoint<CGFloat>(x: 0.5, y: 0.5)

            let tr = ControlPointsTransform(p0: p0, p1: p1, p2: p2, p3: p3)

            for _ in 0 ..< 1000 {
                acum += tr.inverse(p).x
                acum += tr.inverse(p).y

                acum += tr.inverse(p0).x
                acum += tr.inverse(p0).y

                acum -= tr.inverse(p0).x
                acum -= tr.inverse(p0).y

                acum += tr.inverse(p1).x
                acum += tr.inverse(p1).y

                acum -= tr.inverse(p1).x
                acum -= tr.inverse(p1).y

                acum += tr.inverse(p2).x
                acum += tr.inverse(p2).y

                acum -= tr.inverse(p2).x
                acum -= tr.inverse(p2).y

                acum += tr.inverse(p3).x
                acum += tr.inverse(p3).y

                acum -= tr.inverse(p3).x
                acum -= tr.inverse(p3).y
            }

            context.blackHole(acum)
        }

        benchmark.benchmark(name: "Inverse norm") { context in
            var acum = 0.0

            let p0 = MKPoint<CGFloat>(x: 0, y: 0)
            let p1 = MKPoint<CGFloat>(x: 1, y: 0)
            let p2 = MKPoint<CGFloat>(x: 1, y: 1)
            let p3 = MKPoint<CGFloat>(x: 0, y: 1)

            let p = MKPoint<CGFloat>(x: 0.5, y: 0.5)

            let tr = ControlPointsTransform(p0: p0, p1: p1, p2: p2, p3: p3)

            for _ in 0 ..< 1000 {
                acum += tr.inverse(p).x
                acum += tr.inverse(p).y

                acum += tr.inverse(p0).x
                acum += tr.inverse(p0).y

                acum -= tr.inverse(p0).x
                acum -= tr.inverse(p0).y

                acum += tr.inverse(p1).x
                acum += tr.inverse(p1).y

                acum -= tr.inverse(p1).x
                acum -= tr.inverse(p1).y

                acum += tr.inverse(p2).x
                acum += tr.inverse(p2).y

                acum -= tr.inverse(p2).x
                acum -= tr.inverse(p2).y

                acum += tr.inverse(p3).x
                acum += tr.inverse(p3).y

                acum -= tr.inverse(p3).x
                acum -= tr.inverse(p3).y
            }

            context.blackHole(acum)
        }

        benchmark.start()
    }
}
