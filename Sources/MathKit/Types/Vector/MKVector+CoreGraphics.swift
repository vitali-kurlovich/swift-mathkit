//
//  Created by Vitali Kurlovich on 10.01.26.
//

#if canImport(CoreGraphics)
    import CoreGraphics

    public extension MKVector {
        @inlinable init(_ v: CGVector) where Float: BinaryFloatingPoint {
            self.init(dx: Float(v.dx), dy: Float(v.dy))
        }
    }

    public extension CGVector {
        @inlinable init<F: BinaryFloatingPoint>(_ p: MKVector<F>) {
            self.init(dx: CGFloat(p.dx), dy: CGFloat(p.dy))
        }
    }

#endif // canImport(CoreGraphics)
