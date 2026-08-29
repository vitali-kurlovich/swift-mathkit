//
//  Created by Kurlovich Vitali on 8/28/26.
//

import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.0000000001
private let halfTolerance: Float32 = 0.0001
private let lowTolerance: Float16 = 0.1

struct MKLineTest {}

extension MKLineTest {
    @Test
    func point() {
        let zeroLine = MKLine<Double>(
            pivot: .zero,
            direction: .init(dx: 2, dy: 3)
        )

        #expect(
            zeroLine.point(at: 0).isEqual(to: .zero, tolerance: tolerance)
        )

        #expect(
            zeroLine
                .point(at: -2)
                .isEqual(to: .init(x: -4, y: -6), tolerance: tolerance)
        )

        #expect(
            zeroLine
                .point(at: 2)
                .isEqual(to: .init(x: 4, y: 6), tolerance: tolerance)
        )

        let positiveLine = MKLine<Double>(pivot: .init(x: 5, y: 10), direction: .init(dx: 2, dy: 3))

        #expect(
            positiveLine.point(at: 0).isEqual(to: .init(x: 5, y: 10), tolerance: tolerance)
        )

        #expect(
            positiveLine
                .point(at: -2)
                .isEqual(to: .init(x: 1, y: 4), tolerance: tolerance)
        )

        #expect(
            positiveLine
                .point(at: 2)
                .isEqual(to: .init(x: 9, y: 16), tolerance: tolerance)
        )
    }
}

extension MKLineTest {
    @Test
    func intersection() throws {
        #expect(
            MKLine<Double>(pivot: .init(x: 5, y: 10), direction: .init(dx: 2, dy: 3))
                .intersection(
                    MKLine<Double>(pivot: .init(x: 5, y: 10), direction: .init(dx: -2, dy: -3))
                ) == nil
        )

        #expect(
            MKLine<Double>(pivot: .init(x: 5, y: 10), direction: .init(dx: 2, dy: 3))
                .intersection(
                    MKLine<Double>(pivot: .init(x: 4, y: 9), direction: .init(dx: 2, dy: 3))
                ) == nil
        )

        #expect(
            MKLine<Double>(pivot: .init(x: 5, y: 10), direction: .init(dx: 2, dy: 3))
                .intersection(
                    MKLine<Double>(pivot: .init(x: 4, y: 9), direction: .init(dx: -2, dy: -3))
                ) == nil
        )

        let result = try #require(
            MKLine<Double>(pivot: .init(x: 5, y: 10), direction: .init(dx: 2, dy: 3))
                .intersection(
                    MKLine<Double>(pivot: .init(x: 5, y: 10), direction: .init(dx: 3, dy: 2))
                )
        )

        #expect(
            result.isEqual(to: .init(x: 5, y: 10), tolerance: tolerance)
        )
    }
}

extension MKLineTest {
    @Test
    func transform() {
        #expect(
            MKLine<Double>(pivot: .zero, direction: .init(dx: 2, dy: 3))
                .applying(.rotation(.degrees(90))) == .init(
                    pivot: .zero,
                    direction: .init(dx: -3, dy: 2)
                )
        )

        #expect(
            MKLine<Double>(pivot: .init(x: 5, y: 10), direction: .init(dx: 2, dy: 3))
                .applying(.rotation(.degrees(90))) == .init(
                    pivot: .init(x: -10, y: 5),
                    direction: .init(dx: -3, dy: 2)
                )
        )
    }
}
