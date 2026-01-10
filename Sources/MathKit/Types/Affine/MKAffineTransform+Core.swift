//
//  MKAffineTransform+Core.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 10.01.26.
//

#if canImport(UIKit)
    import UIKit

    public extension MKAffineTransform {
        init(_ transform: CGAffineTransform) where Float == CGFloat {
            self.init(m11: transform.a,
                      m12: transform.b,
                      m21: transform.c,
                      m22: transform.d,
                      tx: transform.tx,
                      ty: transform.ty)
        }
    }

#else

    import Foundation

    public extension MKAffineTransform {
        init(_ transform: AffineTransform) where Float == CGFloat {
            self.init(m11: transform.m11,
                      m12: transform.m12,
                      m21: transform.m21,
                      m22: transform.m22,
                      tx: transform.tX,
                      ty: transform.tY)
        }
    }

#endif
