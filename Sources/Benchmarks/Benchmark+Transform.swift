//
//  Benchmark+Transform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 24.12.25.
//

import Benchmarks
import MathKit

extension Benchmark {
    func runTransformBenchmark() {
        let benchmark = BenchmarkExecuter()

        benchmark.benchmark(name: "Transform scale") { context in
            var acum = 0.0

            let p0 = CGPoint(x: 0, y: 0)
            let p1 = CGPoint(x: 2, y: 0)
            let p2 = CGPoint(x: 2, y: 2)
            let p3 = CGPoint(x: 0, y: 2)

            let tr = ControlPointsTransform(p0: p0, p1: p1, p2: p2, p3: p3)

            for _ in 0 ..< 10_000_000 {
                acum += tr.transform(.init(x: 0.5, y: 0.5)).x
                acum -= tr.transform(.init(x: 0.5, y: 0.5)).y

                acum += tr.transform(.init(x: 0.25, y: 0.75)).x
                acum -= tr.transform(.init(x: 0.75, y: 0.25)).y

                acum += tr.transform(.init(x: 0.75, y: 0.25)).x
                acum -= tr.transform(.init(x: 0.25, y: 0.75)).y
            }

            context.blackHole(acum)
        }

        benchmark.benchmark(name: "Transform parallel") { context in
            var acum = 0.0

            let p0 = CGPoint(x: 0, y: 0)
            let p1 = CGPoint(x: 2, y: 0)
            let p2 = CGPoint(x: 1, y: 2)
            let p3 = CGPoint(x: -1, y: 2)

            let tr = ControlPointsTransform(p0: p0, p1: p1, p2: p2, p3: p3)

            for _ in 0 ..< 10_000_000 {
                acum += tr.transform(.init(x: 0.5, y: 0.5)).x
                acum -= tr.transform(.init(x: 0.5, y: 0.5)).y

                acum += tr.transform(.init(x: 0.25, y: 0.75)).x
                acum -= tr.transform(.init(x: 0.75, y: 0.25)).y

                acum += tr.transform(.init(x: 0.75, y: 0.25)).x
                acum -= tr.transform(.init(x: 0.25, y: 0.75)).y
            }

            context.blackHole(acum)
        }

        benchmark.benchmark(name: "Transform") { context in
            var acum = 0.0

            let p0 = CGPoint(x: -10, y: -20)
            let p1 = CGPoint(x: 10, y: -10)
            let p2 = CGPoint(x: 15, y: 20)
            let p3 = CGPoint(x: -20, y: 15)

            let tr = ControlPointsTransform(p0: p0, p1: p1, p2: p2, p3: p3)

            for _ in 0 ..< 10_000_000 {
                acum += tr.transform(.init(x: 0.5, y: 0.5)).x
                acum -= tr.transform(.init(x: 0.5, y: 0.5)).y

                acum += tr.transform(.init(x: 0.25, y: 0.75)).x
                acum -= tr.transform(.init(x: 0.75, y: 0.25)).y

                acum += tr.transform(.init(x: 0.75, y: 0.25)).x
                acum -= tr.transform(.init(x: 0.25, y: 0.75)).y
            }
            context.blackHole(acum)
        }

        benchmark.start()
    }
}
