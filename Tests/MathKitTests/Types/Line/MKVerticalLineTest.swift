//
//  Created by Kurlovich Vitali on 8/28/26.
//

import Foundation
import MathKit
import Testing

private let tolerance: Double = 0.0000000001
private let halfTolerance: Float32 = 0.0001
private let lowTolerance: Float16 = 0.1

struct MKVerticalLineTest {}

extension MKVerticalLineTest {
    @Test
    func point() {
        let zeroLine = MKVerticalLine<Double>(x: 0)

        #expect(
            zeroLine.point(at: 0).isEqual(to: .zero, tolerance: tolerance)
        )

        #expect(
            zeroLine
                .point(at: -2)
                .isEqual(to: .init(x: 0, y: -2), tolerance: tolerance)
        )

        #expect(
            zeroLine
                .point(at: 2)
                .isEqual(to: .init(x: 0, y: 2), tolerance: tolerance)
        )

        let positiveLine = MKVerticalLine<Double>(x: 10)

        #expect(
            positiveLine.point(at: 0).isEqual(to: .init(x: 10, y: 0), tolerance: tolerance)
        )

        #expect(
            positiveLine
                .point(at: -2)
                .isEqual(to: .init(x: 10, y: -2), tolerance: tolerance)
        )

        #expect(
            positiveLine
                .point(at: 2)
                .isEqual(to: .init(x: 10, y: 2), tolerance: tolerance)
        )

        let negativeLine = MKVerticalLine<Double>(x: -10)

        #expect(
            negativeLine.point(at: 0).isEqual(to: .init(x: -10, y: 0), tolerance: tolerance)
        )

        #expect(
            negativeLine
                .point(at: -2)
                .isEqual(to: .init(x: -10, y: -2), tolerance: tolerance)
        )

        #expect(
            negativeLine
                .point(at: 2)
                .isEqual(to: .init(x: -10, y: 2), tolerance: tolerance)
        )
    }
}

extension MKVerticalLineTest {
    @Test
    func intersection() {
        #expect(
            MKVerticalLine<Double>(x: 0).intersection(MKVerticalLine<Double>(x: 0)) == nil
        )

        #expect(
            MKVerticalLine<Double>(x: 5).intersection(MKVerticalLine<Double>(x: 2)) == nil
        )

        #expect(
            MKVerticalLine<Double>(x: 2)
                .intersection(MKHorizontalLine<Double>(y: 5)) == .init(x: 2, y: 5)
        )
    }
}

extension MKVerticalLineTest {
    @Test
    func transform() {
        #expect(
            MKVerticalLine<Double>(x: 0)
                .applying(.rotation(.degrees(90))) == .init(
                    pivot: .zero,
                    direction: .init(dx: -1, dy: 0)
                )
        )

        #expect(
            MKVerticalLine<Double>(x: 10)
                .applying(.rotation(.degrees(90))) == .init(
                    pivot: .init(x: 0, y: 10),
                    direction: .init(dx: -1, dy: 0)
                )
        )
    }
}
