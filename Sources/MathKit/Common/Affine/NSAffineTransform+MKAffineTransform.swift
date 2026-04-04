//
//  Created by Vitali Kurlovich on 04.04.2026.
//

#if os(macOS) || os(Linux)

    import Foundation

    public extension AffineTransform {
        init<Float: BinaryFloatingPoint>(_ tr: MKAffineTransform<Float>) {
            self.init(m11: CGFloat(tr.m11), m12: CGFloat(tr.m12),
                      m21: CGFloat(tr.m21), m22: CGFloat(tr.m22),
                      tX: CGFloat(tr.tx), tY: CGFloat(tr.ty))
        }
    }

    public extension NSAffineTransformStruct {
        init<Float: BinaryFloatingPoint>(_ tr: MKAffineTransform<Float>) {
            self.init(m11: CGFloat(tr.m11), m12: CGFloat(tr.m12),
                      m21: CGFloat(tr.m21), m22: CGFloat(tr.m22),
                      tX: CGFloat(tr.tx), tY: CGFloat(tr.ty))
        }
    }

    public extension NSAffineTransform {
        convenience init<Float: BinaryFloatingPoint>(_ tr: MKAffineTransform<Float>) {
            let t = AffineTransform(tr)

            self.init(transform: t)
        }
    }

    public extension MKAffineTransform where Float: BinaryFloatingPoint {
        init(_ tr: AffineTransform) {
            self.init(m11: Float(tr.m11), m12: Float(tr.m12),
                      m21: Float(tr.m21), m22: Float(tr.m22),
                      tx: Float(tr.tX), ty: Float(tr.tY))
        }

        init(_ tr: NSAffineTransformStruct) {
            self.init(m11: Float(tr.m11), m12: Float(tr.m12),
                      m21: Float(tr.m21), m22: Float(tr.m22),
                      tx: Float(tr.tX), ty: Float(tr.tY))
        }

        init(_ tr: NSAffineTransform) {
            self.init(tr.transformStruct)
        }
    }

#endif
