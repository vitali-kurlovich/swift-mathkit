//
//  Created by Kurlovich Vitali on 8/31/26.
//

#if canImport(CoreGraphics)
    import CoreGraphics

    public struct CGSegment: Hashable, Sendable {
        public var point1: CGPoint
        public var point2: CGPoint

        public init(
            point1: CGPoint,
            point2: CGPoint
        ) {
            self.point1 = point1
            self.point2 = point2
        }
    }

    public extension CGSegment {
        @inlinable
        init<Float: BinaryFloatingPoint & Sendable>(point1: MKPoint<Float>, point2: MKPoint<Float>) {
            self.init(point1: .init(point1), point2: .init(point2))
        }

        @inlinable
        init(_ segment: MKSegment<some BinaryFloatingPoint>) {
            self.init(point1: .init(segment.point1), point2: .init(segment.point2))
        }
    }

    public extension MKSegment {
        @inlinable
        init(_ segment: CGSegment) where Float: BinaryFloatingPoint {
            self.init(
                point1: MKPoint<Float>(segment.point1),
                point2: MKPoint<Float>(segment.point2)
            )
        }
    }

    public extension CGSegment {
        func intersection(_ other: some CGLine2D) -> CGPoint? {
            let segment = MKSegment<CGFloat>(self)
            if let p = segment.intersection(MKLine<CGFloat>(other)) {
                return .init(p)
            }

            return nil
        }
    }

    public extension CGLine2D {
        func intersection(_ segment: CGSegment) -> CGPoint? {
            segment.intersection(self)
        }
    }

    public extension CGLine2D {
        func intersection(_ rect: CGRect) -> CGSegment? {
            let rect = MKRect<CGFloat>(rect)

            if let segment = MKLine<CGFloat>(self).intersection(rect) {
                return .init(segment)
            }
            return nil
        }
    }

#endif
