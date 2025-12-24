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
