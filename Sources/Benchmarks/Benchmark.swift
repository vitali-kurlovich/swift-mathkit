//
//  Benchmark.swift
//  swift-random
//
//  Created by Vitali Kurlovich on 30.03.25.
//

import ArgumentParser
import Benchmarks
import MathKit

import struct CoreFoundation.CGFloat
import struct CoreFoundation.CGPoint
import struct CoreFoundation.CGVector

@main
struct Benchmark: ParsableCommand {
    @Argument(help: "The phrase to repeat.")
    var `repeat`: Int = 5

    func benchmark(name _: String, task _: @escaping (BenchmarkContext) -> Void) {}

    func prepare() {}

    mutating func run() throws {
        runLerpBenchmark()
    }
}

private extension Benchmark {
    func runLerpBenchmark() {
        let benchmark = BenchmarkExecuter()

        benchmark.benchmark(name: "Lerp double") { context in
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
