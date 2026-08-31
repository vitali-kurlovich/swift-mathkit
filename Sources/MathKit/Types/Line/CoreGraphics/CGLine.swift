//
//  Created by Kurlovich Vitali on 8/30/26.
//

#if canImport(CoreGraphics)
    import CoreGraphics

    public struct CGLine: CGLine2D, Hashable, Sendable {
        public var pivot: CGPoint
        public var direction: CGVector {
            didSet {
                assert(direction != .zero)
            }
        }

        @inlinable
        public init(pivot: CGPoint, direction: CGVector) {
            assert(direction != .zero)
            self.pivot = pivot
            self.direction = direction
        }
    }

    public extension CGLine {
        @inlinable
        init<Float: BinaryFloatingPoint & Sendable>(pivot: MKPoint<Float>, direction: MKVector<Float>) {
            self.init(pivot: .init(pivot), direction: .init(direction))
        }

        @inlinable
        init(
            _ line: MKLine<some BinaryFloatingPoint>
        ) {
            self.init(pivot: line.pivot, direction: line.direction)
        }
    }

    public extension MKLine where Float: BinaryFloatingPoint {
        @inlinable
        init(_ line: CGLine2D) {
            self.init(pivot: .init(line.pivot), direction: .init(line.direction))
        }
    }

#endif
