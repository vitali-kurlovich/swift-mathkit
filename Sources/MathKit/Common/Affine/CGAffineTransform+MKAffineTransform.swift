//
//  Created by Vitali Kurlovich on 04.04.2026.
//

#if canImport(CoreGraphics)
    import CoreGraphics

    public extension CGAffineTransform {
        init<Float: BinaryFloatingPoint>(_ tr: MKAffineTransform<Float>) {
            self.init(CGFloat(tr.m11), CGFloat(tr.m12),
                      CGFloat(tr.m21), CGFloat(tr.m22),
                      CGFloat(tr.tx), CGFloat(tr.ty))
        }
    }

    public extension MKAffineTransform where Float: BinaryFloatingPoint {
        init(_ tr: CGAffineTransform) {
            self.init(m11: Float(tr.a), m12: Float(tr.b),
                      m21: Float(tr.c), m22: Float(tr.d),
                      tx: Float(tr.tx), ty: Float(tr.ty))
        }
    }

#endif
