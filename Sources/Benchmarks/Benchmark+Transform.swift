//
//  Benchmark+Transform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 24.12.25.
//

import Benchmarks
import MathKit

import struct CoreFoundation.CGPoint

extension Benchmark {
    func runTransformBenchmark() {
        let benchmark = BenchmarkExecuter()

        benchmark.benchmark(name: "Transform (zero)") { context in
            var acum = 0.0

            let p0 = CGPoint(x: 0, y: 0)
            let p1 = CGPoint(x: 1, y: 0)
            let p2 = CGPoint(x: 1, y: 1)
            let p3 = CGPoint(x: 0, y: 1)

            for _ in 0 ..< 10_000_000 {
                acum += transform(p0: p0, p1: p1, p2: p2, p3: p3,
                                  uv: CGPoint(x: 0, y: 0)).x

                acum -= transform(p0: p0, p1: p1, p2: p2, p3: p3,
                                  uv: CGPoint(x: 0, y: 0)).y
            }

            context.blackHole(acum)
        }

        benchmark.start()
    }
}
