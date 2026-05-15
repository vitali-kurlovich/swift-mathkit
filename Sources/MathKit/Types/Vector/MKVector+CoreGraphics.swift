//
//  Created by Vitali Kurlovich on 10.01.26.
//

#if canImport(CoreGraphics)
    import struct CoreFoundation.CGFloat
    import struct CoreGraphics.CGVector

    public extension MKVector {
        @inlinable init(_ v: CGVector) where Float: BinaryFloatingPoint {
            self.init(dx: Float(v.dx), dy: Float(v.dy))
        }
    }

    public extension CGVector {
        @inlinable init(_ p: MKVector<some BinaryFloatingPoint>) {
            self.init(dx: CGFloat(p.dx), dy: CGFloat(p.dy))
        }
    }

#endif // canImport(CoreGraphics)
