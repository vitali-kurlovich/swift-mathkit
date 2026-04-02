//
//  Created by Vitali Kurlovich on 02.04.2026.
//

import MathKit
import Testing

private let tolerance: Double = 0.00000001

@Suite("MKVector")
struct MKVectorTests {
    @Test("Zero")
    func zero() throws {
        let vec = MKVector<Double>.zero

        #expect(vec.dx == 0)
        #expect(vec.dy == 0)
    }

    @Test("Identity")
    func identity() throws {
        let vec = MKVector<Double>.identity

        #expect(vec.dx == 1)
        #expect(vec.dy == 1)
    }

    @Test("Negative")
    func negative() throws {
        let vec = MKVector<Double>(dx: 2, dy: 3)

        #expect((-vec).dx == -2)
        #expect((-vec).dy == -3)
    }

    @Test("Addittion")
    func add() throws {
        var vec = MKVector<Double>(dx: 2, dy: 3) + MKVector<Double>(dx: 10, dy: 7)

        #expect(vec.isEqual(to: .init(dx: 12, dy: 10), tolerance: tolerance))

        vec += MKVector<Double>(dx: 8, dy: 10)

        #expect(vec.isEqual(to: .init(dx: 20, dy: 20), tolerance: tolerance))
    }

    @Test("Addittion Size")
    func addSize() throws {
        var vec = MKVector<Double>(dx: 2, dy: 3) + MKSize<Double>(width: 10, height: 7)

        #expect(vec.isEqual(to: .init(dx: 12, dy: 10), tolerance: tolerance))

        vec += MKSize<Double>(width: 8, height: 10)

        #expect(vec.isEqual(to: .init(dx: 20, dy: 20), tolerance: tolerance))
    }

    @Test("Substraction")
    func sub() throws {
        var vec = MKVector<Double>(dx: 2, dy: 3) - MKVector<Double>(dx: 4, dy: 6)

        #expect(vec.isEqual(to: .init(dx: -2, dy: -3), tolerance: tolerance))

        vec -= MKVector<Double>(dx: 8, dy: 10)

        #expect(vec.isEqual(to: .init(dx: -10, dy: -13), tolerance: tolerance))
    }

    @Test("Substraction Size")
    func subSize() throws {
        var vec = MKVector<Double>(dx: 2, dy: 3) - MKSize<Double>(width: 4, height: 6)

        #expect(vec.isEqual(to: .init(dx: -2, dy: -3), tolerance: tolerance))

        vec -= MKSize<Double>(width: 8, height: 10)

        #expect(vec.isEqual(to: .init(dx: -10, dy: -13), tolerance: tolerance))
    }

    @Test("Multiply")
    func mul() throws {
        var vec = MKVector<Double>(dx: 2, dy: 3) * 2

        #expect(vec.isEqual(to: .init(dx: 4, dy: 6), tolerance: tolerance))

        vec *= 3

        #expect(vec.isEqual(to: .init(dx: 12, dy: 18), tolerance: tolerance))

        #expect((0.5 * vec).isEqual(to: .init(dx: 6, dy: 9), tolerance: tolerance))

        vec *= MKVector<Double>(dx: 20, dy: 10)

        #expect(vec.isEqual(to: .init(dx: 240, dy: 180), tolerance: tolerance))
    }

    @Test("Divide")
    func div() throws {
        var vec = MKVector<Double>(dx: 8, dy: 12) / 2

        #expect(vec.isEqual(to: .init(dx: 4, dy: 6), tolerance: tolerance))

        vec /= 2

        #expect(vec.isEqual(to: .init(dx: 2, dy: 3), tolerance: tolerance))

        #expect((6 / vec).isEqual(to: .init(dx: 3, dy: 2), tolerance: tolerance))

        vec /= MKVector<Double>(dx: 4, dy: 6)

        #expect(vec.isEqual(to: .init(dx: 0.5, dy: 0.5), tolerance: tolerance))
    }
}
