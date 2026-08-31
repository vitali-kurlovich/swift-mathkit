//
//  Created by Kurlovich Vitali on 8/30/26.
//

#if canImport(CoreGraphics)
    import CoreGraphics

    public struct CGVerticalLine: Hashable, Sendable {
        public var x: CGFloat

        @inlinable
        public init(x: CGFloat) {
            self.x = x
        }
    }

    extension CGVerticalLine: CGLine2D {
        @inlinable
        public var pivot: CGPoint {
            .init(x: x, y: 0)
        }

        @inlinable
        public var direction: CGVector {
            .init(dx: 0, dy: 1)
        }
    }

    public extension CGVerticalLine {
        @inlinable
        init(_ line: MKVerticalLine<some BinaryFloatingPoint>) {
            self.init(x: .init(line.x))
        }
    }

    public extension MKVerticalLine where Float: BinaryFloatingPoint {
        @inlinable
        init(_ line: CGVerticalLine) {
            self.init(x: .init(line.x))
        }
    }

#endif
