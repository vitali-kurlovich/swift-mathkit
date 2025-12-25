//
//  Benchmark+Inverse.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 25.12.25.
//

import Benchmarks
import MathKit

import struct CoreFoundation.CGPoint

extension Benchmark {
    func runInverseBenchmark() {
        let benchmark = BenchmarkExecuter()

        benchmark.benchmark(name: "Inverse") { context in
            var acum = 0.0

            let p0 = CGPoint(x: -10, y: -20)
            let p1 = CGPoint(x: 10, y: -10)
            let p2 = CGPoint(x: 15, y: 20)
            let p3 = CGPoint(x: -20, y: 15)

            for _ in 0 ..< 10_000_000 {
                acum += inverse(p0: p0, p1: p1, p2: p2, p3: p3, target: p0).x
                acum += inverse(p0: p0, p1: p1, p2: p2, p3: p3, target: p0).y

                acum -= inverse(p0: p1, p1: p0, p2: p3, p3: p2, target: p0).x
                acum -= inverse(p0: p0, p1: p1, p2: p2, p3: p3, target: p0).y
            }

            context.blackHole(acum)
        }

        benchmark.benchmark(name: "Inverse Opt") { context in
            var acum = 0.0

            let p0 = CGPoint(x: -10, y: -20)
            let p1 = CGPoint(x: 10, y: -10)
            let p2 = CGPoint(x: 15, y: 20)
            let p3 = CGPoint(x: -20, y: 15)

            for _ in 0 ..< 10_000_000 {
                acum += inverse_opt(p0: p0, p1: p1, p2: p2, p3: p3, target: p0).x
                acum += inverse_opt(p0: p0, p1: p1, p2: p2, p3: p3, target: p0).y

                acum -= inverse_opt(p0: p1, p1: p0, p2: p3, p3: p2, target: p0).x
                acum -= inverse_opt(p0: p0, p1: p1, p2: p2, p3: p3, target: p0).y
            }

            context.blackHole(acum)
        }

        benchmark.start()
    }
}
