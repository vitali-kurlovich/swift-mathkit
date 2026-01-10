//
//  MKAffineTransform+Equal.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 10.01.26.
//

#if canImport(UIKit)
    import UIKit

    public extension MKAffineTransform {
        static func == (lhs: Self, rhs: CGAffineTransform) -> Bool where Float == CGFloat {
            lhs.m11 == rhs.a &&
                lhs.m12 == rhs.b &&

                lhs.m21 == rhs.c &&
                lhs.m22 == rhs.d &&

                lhs.tx == rhs.tx &&
                lhs.ty == rhs.ty
        }

        static func == (lhs: CGAffineTransform, rhs: Self) -> Bool where Float == CGFloat {
            rhs == lhs
        }
    }

#else

    import Foundation

    public extension MKAffineTransform {
        static func == (lhs: Self, rhs: AffineTransform) -> Bool where Float == CGFloat {
            lhs.m11 == rhs.m11 &&
                lhs.m12 == rhs.m12 &&

                lhs.m21 == rhs.m21 &&
                lhs.m22 == rhs.m22 &&

                lhs.tx == rhs.tX &&
                lhs.ty == rhs.tY
        }

        static func == (lhs: AffineTransform, rhs: Self) -> Bool where Float == CGFloat {
            rhs == lhs
        }
    }

#endif
