//
//  Benchmark+Lerp.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 24.12.25.
//

import Benchmarks
import MathKit

extension Benchmark {
    func runLerpBenchmark() {
        let benchmark = BenchmarkExecuter()

        benchmark.benchmark(name: "Lerp Double") { context in
            var acum = 0.0
            for _ in 0 ..< 10_000_000 {
                acum += lerp(20.0, 40.0, t: 0.0)
                acum -= lerp(20.0, 40.0, t: 0.5)
                acum += lerp(20.0, 40.0, t: 1.0)
            }

            context.blackHole(acum)
        }

        benchmark.benchmark(name: "Lerp CGPoint") { context in
            var acum: CGFloat = 0

            for _ in 0 ..< 10_000_000 {
                acum += lerp(CGPoint(x: 10, y: 20),
                             CGPoint(x: 60, y: 80), t: 0.0).x
                acum -= lerp(CGPoint(x: 10, y: 20),
                             CGPoint(x: 60, y: 80), t: 0.0).y

                acum += lerp(CGPoint(x: 10, y: 20),
                             CGPoint(x: 60, y: 80), t: 0.5).x
                acum -= lerp(CGPoint(x: 10, y: 20),
                             CGPoint(x: 60, y: 80), t: 0.5).y

                acum += lerp(CGPoint(x: 10, y: 20),
                             CGPoint(x: 60, y: 80), t: 1.0).x
                acum -= lerp(CGPoint(x: 10, y: 20),
                             CGPoint(x: 60, y: 80), t: 1.0).y
            }

            context.blackHole(acum)
        }

        benchmark.benchmark(name: "Lerp CGVector") { context in
            var acum: CGFloat = 0

            for _ in 0 ..< 10_000_000 {
                acum += lerp(CGVector(dx: 10, dy: 20),
                             CGVector(dx: 60, dy: 80), t: 0.0).dx

                acum -= lerp(CGVector(dx: 10, dy: 20),
                             CGVector(dx: 60, dy: 80), t: 0.0).dy

                acum += lerp(CGVector(dx: 10, dy: 20),
                             CGVector(dx: 60, dy: 80), t: 0.5).dx

                acum -= lerp(CGVector(dx: 10, dy: 20),
                             CGVector(dx: 60, dy: 80), t: 0.5).dy

                acum += lerp(CGVector(dx: 10, dy: 20),
                             CGVector(dx: 60, dy: 80), t: 1.0).dx

                acum -= lerp(CGVector(dx: 10, dy: 20),
                             CGVector(dx: 60, dy: 80), t: 1.0).dy
            }

            context.blackHole(acum)
        }

        benchmark.start()
    }
}
