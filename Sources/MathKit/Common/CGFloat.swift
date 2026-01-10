//
//  CGFloat.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 11.01.26.
//

import Foundation
import RealModule

extension CGFloat: @retroactive RealFunctions {}
extension CGFloat: @retroactive AlgebraicField {}
extension CGFloat: @retroactive ElementaryFunctions {}
extension CGFloat: @retroactive Real {
    public static func atan2(y: CGFloat, x: CGFloat) -> CGFloat {
        CGFloat(Double.atan2(y: y, x: x))
    }

    public static func erf(_ x: CGFloat) -> CGFloat {
        CGFloat(Double.erf(x))
    }

    public static func erfc(_ x: CGFloat) -> CGFloat {
        CGFloat(Double.erfc(x))
    }

    public static func exp2(_ x: CGFloat) -> CGFloat {
        CGFloat(Double.exp2(x))
    }

    public static func hypot(_ x: CGFloat, _ y: CGFloat) -> CGFloat {
        CGFloat(Double.hypot(x, y))
    }

    public static func gamma(_ x: CGFloat) -> CGFloat {
        CGFloat(Double.gamma(x))
    }

    public static func log2(_ x: CGFloat) -> CGFloat {
        CGFloat(Double.log2(x))
    }

    public static func log10(_ x: CGFloat) -> CGFloat {
        CGFloat(Double.log10(x))
    }

    public static func logGamma(_ x: CGFloat) -> CGFloat {
        CGFloat(Double.logGamma(x))
    }

    public static func exp(_ x: CGFloat) -> CGFloat {
        CGFloat(Double.exp(x))
    }

    public static func expMinusOne(_ x: CGFloat) -> CGFloat {
        CGFloat(Double.expMinusOne(x))
    }

    public static func cosh(_ x: CGFloat) -> CGFloat {
        CGFloat(Double.cosh(x))
    }

    public static func sinh(_ x: CGFloat) -> CGFloat {
        CGFloat(Double.sinh(x))
    }

    public static func tanh(_ x: CGFloat) -> CGFloat {
        CGFloat(Double.tanh(x))
    }

    public static func cos(_ x: CGFloat) -> CGFloat {
        CGFloat(Double.cos(x))
    }

    public static func sin(_ x: CGFloat) -> CGFloat {
        CGFloat(Double.sin(x))
    }

    public static func tan(_ x: CGFloat) -> CGFloat {
        CGFloat(Double.tan(x))
    }

    public static func log(_ x: CGFloat) -> CGFloat {
        CGFloat(Double.log(x))
    }

    public static func log(onePlus x: CGFloat) -> CGFloat {
        CGFloat(Double.log(onePlus: x))
    }

    public static func acosh(_ x: CGFloat) -> CGFloat {
        CGFloat(Double.acosh(x))
    }

    public static func asinh(_ x: CGFloat) -> CGFloat {
        CGFloat(Double.asinh(x))
    }

    public static func atanh(_ x: CGFloat) -> CGFloat {
        CGFloat(Double.atanh(x))
    }

    public static func acos(_ x: CGFloat) -> CGFloat {
        CGFloat(Double.acos(x))
    }

    public static func asin(_ x: CGFloat) -> CGFloat {
        CGFloat(Double.asin(x))
    }

    public static func atan(_ x: CGFloat) -> CGFloat {
        CGFloat(Double.atan(x))
    }

    public static func pow(_ x: CGFloat, _ y: CGFloat) -> CGFloat {
        CGFloat(Double.pow(x, y))
    }

    public static func pow(_ x: CGFloat, _ n: Int) -> CGFloat {
        CGFloat(Double.pow(x, n))
    }

    public static func root(_ x: CGFloat, _ n: Int) -> CGFloat {
        CGFloat(Double.root(x, n))
    }
}
