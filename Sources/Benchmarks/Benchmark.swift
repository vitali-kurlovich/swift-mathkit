//
//  Benchmark.swift
//  swift-random
//
//  Created by Vitali Kurlovich on 30.03.25.
//

import ArgumentParser
import Benchmarks
import MathKit

@main
struct Benchmark: ParsableCommand {
    @Argument(help: "The phrase to repeat.")
    var `repeat`: Int = 5

    func benchmark(name _: String, task _: @escaping (BenchmarkContext) -> Void) {}

    func prepare() {}

    mutating func run() throws {
        runBenchmark()
    }
}

private extension Benchmark {
    func runBenchmark() {
        let benchmark = BenchmarkExecuter()

        benchmark.benchmark(name: "Lerp") { context in
            var i = 0.0
            for _ in 0 ..< 10_000_000 {
                i += lerp(20.0, 40.0, t: 0.0)
                i -= lerp(20.0, 40.0, t: 0.5)
                i += lerp(20.0, 40.0, t: 1.0)
            }

            context.blackHole(i)
        }

        benchmark.start()
    }
}
