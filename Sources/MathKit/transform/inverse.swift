//
//  inverse.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 24.12.25.
//

import struct CoreFoundation.CGPoint

public func inverse(p0: CGPoint, p1: CGPoint, p2: CGPoint, p3: CGPoint, target: CGPoint) -> CGPoint {
    let px = target.x
    let py = target.y

    let x0 = p0.x
    let y0 = p0.y

    let x1 = p1.x
    let y1 = p1.y

    let x2 = p2.x
    let y2 = p2.y

    let x3 = p3.x
    let y3 = p3.y

    //  py (x0 - x1 + x2 - x3) - x2 y0 + 2 x3 y0 - x3 y1 + x0 y2 - 2 x0 y3 + x1 y3 + px (-y0 + y1 - y2 + y3) -> PP
    let PP = py * (x0 - x1 + x2 - x3) - x2 * y0 + 2 * x3 * y0 - x3 * y1 + x0 * y2 - 2 * x0 * y3 + x1 * y3 + px * (-y0 + y1 - y2 + y3)

    // 4 (x2 (y0 - y1) + x3 (-y0 + y1) - (x0 - x1) (y2 - y3)) (py (x0 - x3) + x3 y0 - x0 y3 + px (-y0 + y3)) -> AA
    let AA = 4 * (x2 * (y0 - y1) + x3 * (-y0 + y1) - (x0 - x1) * (y2 - y3)) * (py * (x0 - x3) + x3 * y0 - x0 * y3 + px * (-y0 + y3))

    // py x0 - py x1 + py x2 - py x3 - px y0 - x2 y0 + 2 x3 y0 + px y1 - x3 y1 - px y2 + x0 y2 + px y3 - 2 x0 y3 + x1 y3 -> BB
    let BB = py * x0 - py * x1 + py * x2 - py * x3 - px * y0 - x2 * y0 + 2 * x3 * y0 + px * y1 - x3 * y1 - px * y2 + x0 * y2 + px * y3 - 2 * x0 * y3 + x1 * y3

    // -py x0 + py x1 - py x2 + py x3 + px y0 - 2 x1 y0 + x2 y0 - px y1 + 2 x0 y1 - x3 y1 + px y2 - x0 y2 - px y3 + x1 y3 -> CC
    let CC = -py * x0 + py * x1 - py * x2 + py * x3 + px * y0 - 2 * x1 * y0 + x2 * y0 - px * y1 + 2 * x0 * y1 - x3 * y1 + px * y2 - x0 * y2 - px * y3 + x1 * y3

    // py x0 - py x1 + py x2 - py x3 - px y0 + 2 x1 y0 - x2 y0 + px y1 - 2 x0 y1 + x3 y1 - px y2 + x0 y2 + px y3 - x1 y3 -> EE

    let EE = py * x0 - py * x1 + py * x2 - py * x3 - px * y0 + 2 * x1 * y0 - x2 * y0 + px * y1 - 2 * x0 * y1 + x3 * y1 - px * y2 + x0 * y2 + px * y3 - x1 * y3
    // -py x0 + py x1 - py x2 + py x3 + px y0 + x2 y0 - 2 x3 y0 - px y1 + x3 y1 + px y2 - x0 y2 - px y3 + 2 x0 y3 - x1 y3 -> NN
    let NN = -py * x0 + py * x1 - py * x2 + py * x3 + px * y0 + x2 * y0 - 2 * x3 * y0 - px * y1 + x3 * y1 + px * y2 - x0 * y2 - px * y3 + 2 * x0 * y3 - x1 * y3

    //  (x2 (y0 - y1) + x3 (-y0 + y1) - (x0 - x1) (y2 - y3)) -> DU
    let DU = (x2 * (y0 - y1) + x3 * (-y0 + y1) - (x0 - x1) * (y2 - y3))

    // ((x0 - x3) (y1 - y2) + x2 (y0 - y3) + x1 (-y0 + y3)) -> DV
    let DV = ((x0 - x3) * (y1 - y2) + x2 * (y0 - y3) + x1 * (-y0 + y3))

    // (-((x0 - x3) (y1 - y2)) + x1 (y0 - y3) + x2 (-y0 + y3)) -> DVV
    let DVV = (-((x0 - x3) * (y1 - y2)) + x1 * (y0 - y3) + x2 * (-y0 + y3))

    // Sqrt[AA + PP^2] -> SS
    let SS = (AA + PP * PP).squareRoot()

    /*
     // U -> -((BB + SS)/(2 DU))
     let u = -((BB + SS)/(2 * DU))

     // V -> (CC + SS)/(2 DV)
     let v = (CC + SS)/(2 * DV)

      */

    // U -> (NN + SS)/(2 DU)
    let u = (NN + SS) / (2 * DU)

    // V -> (EE + SS)/(2 DVV)
    let v = (EE + SS) / (2 * DVV)

    return CGPoint(x: u,
                   y: v)
}
