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

    //  (x2 (y0 - y1) + x3 (-y0 + y1) - (x0 - x1) (y2 - y3)) -> DU
    let DU = (x2 * (y0 - y1) + x3 * (-y0 + y1) - (x0 - x1) * (y2 - y3))

    // ((x0 - x3) (y1 - y2) + x2 (y0 - y3) + x1 (-y0 + y3)) -> DV
    let DVL = ((x0 - x3) * (y1 - y2) + x2 * (y0 - y3) + x1 * (-y0 + y3))

    // (-((x0 - x3) (y1 - y2)) + x1 (y0 - y3) + x2 (-y0 + y3)) -> DVV
    let DVR = (-((x0 - x3) * (y1 - y2)) + x1 * (y0 - y3) + x2 * (-y0 + y3))

    // py (x0 - x1 + x2 - x3) - x2 y0 + x3 (2 y0 - y1) + x0 (y2 - 2 y3) + x1 y3 + px (-y0 + y1 - y2 + y3) -> PP
    let PP = py * (x0 - x1 + x2 - x3) - x2 * y0 + x3 * (2 * y0 - y1) + x0 * (y2 - 2 * y3) + x1 * y3 + px * (-y0 + y1 - y2 + y3)

    // 4 (x2 (y0 - y1) + x3 (-y0 + y1) - (x0 - x1) (y2 - y3)) (py (x0 - x3) + x3 y0 - x0 y3 + px (-y0 + y3)) -> AA
    let AA = 4 * (x2 * (y0 - y1) + x3 * (-y0 + y1) - (x0 - x1) * (y2 - y3)) * (py * (x0 - x3) + x3 * y0 - x0 * y3 + px * (-y0 + y3))

    // Sqrt[AA + PP^2] -> SS
    let SS = (AA + PP * PP).squareRoot()

    // py (x0 - x1 + x2 - x3) - x2 y0 + x3 (2 y0 - y1) + x0 (y2 - 2 y3) + x1 y3 + px (-y0 + y1 - y2 + y3) -> BB
    let BB = py * (x0 - x1 + x2 - x3) - x2 * y0 + x3 * (2 * y0 - y1) + x0 * (y2 - 2 * y3) +
        x1 * y3 + px * (-y0 + y1 - y2 + y3)

    // py (-x0 + x1 - x2 + x3) + x2 y0 - x3 y1 + x0 (2 y1 - y2) + px (y0 - y1 + y2 - y3) + x1 (-2 y0 + y3) -> CC
    let CC = py * (-x0 + x1 - x2 + x3) + x2 * y0 - x3 * y1 + x0 * (2 * y1 - y2) + px * (y0 - y1 + y2 - y3) + x1 * (-2 * y0 + y3)

    // py (x0 - x1 + x2 - x3) + 2 x1 y0 - x2 y0 + x3 y1 + x0 (-2 y1 + y2) - x1 y3 + px (-y0 + y1 - y2 + y3) -> EE
    let EE = py * (x0 - x1 + x2 - x3) + 2 * x1 * y0 - x2 * y0 + x3 * y1 + x0 * (-2 * y1 + y2) -
        x1 * y3 + px * (-y0 + y1 - y2 + y3)

    // py (-x0 + x1 - x2 + x3) + x2 y0 + x3 (-2 y0 + y1) + px (y0 - y1 + y2 - y3) - x1 y3 + x0 (-y2 + 2 y3) -> NN
    let NN = py * (-x0 + x1 - x2 + x3) + x2 * y0 + x3 * (-2 * y0 + y1) + px * (y0 - y1 + y2 - y3) - x1 * y3 + x0 * (-y2 + 2 * y3)

    // U -> -((BB + SS)/(2 DU))
    let ul = -((BB + SS) / (2 * DU))
    // V -> (CC + SS)/(2 DV)
    let vl = (CC + SS) / (2 * DVL)

    if ul >= 0, ul <= 1, vl >= 0, vl <= 1 {
        return CGPoint(x: ul, y: vl)
    }

    // U -> (NN + SS)/(2 DU)
    let ur = (NN + SS) / (2 * DU)

    // V -> (EE + SS)/(2 DVR)
    let vr = (EE + SS) / (2 * DVR)

    return CGPoint(x: ur, y: vr)
}

public func inverse_opt(p0: CGPoint, p1: CGPoint, p2: CGPoint, p3: CGPoint, target: CGPoint) -> CGPoint {
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

    let dx01 = x0 - x1
    let dx02 = x0 - x2
    let dx03 = x0 - x3

    let dx12 = x1 - x2
    let dx13 = x1 - x3

    let dx23 = x2 - x3

    let dy01 = y0 - y1
    let dy02 = y0 - y2
    let dy03 = y0 - y3

    let dy12 = y1 - y2
    let dy13 = y1 - y3

    let dy23 = y2 - y3

    //  (x2 (y0 - y1) + x3 (-y0 + y1) - (x0 - x1) (y2 - y3)) -> DU
    // -dx01 dy23 + dy01 x2 - dy01 x3 -> DU
    let DU = -dx01 * dy23 + dy01 * x2 - dy01 * x3

    // ((x0 - x3) (y1 - y2) + x2 (y0 - y3) + x1 (-y0 + y3)) -> DV
    // dx03 dy12 - dy03 x1 + dy03 x2 -> DV
    let DVL = dx03 * dy12 - dy03 * x1 + dy03 * x2

    // (-((x0 - x3) (y1 - y2)) + x1 (y0 - y3) + x2 (-y0 + y3)) -> DVR
    // -dx03 dy12 + dy03 x1 - dy03 x2 -> DVR
    // DVR = -DVL
    let DVR = -DVL

    // py (x0 - x1 + x2 - x3) - x2 y0 + x3 (2 y0 - y1) + x0 (y2 - 2 y3) + x1 y3 + px (-y0 + y1 - y2 + y3) -> PP
    // (dx01 + dx23) py - px (dy01 + dy23) - x2 y0 + x3 (dy01 + y0) + x0 (dy23 - y3) + x1 y3 -> PP
    let PP = (dx01 + dx23) * py - px * (dy01 + dy23) - x2 * y0 + x3 * (dy01 + y0) + x0 * (dy23 - y3) + x1 * y3

    // 4 (x2 (y0 - y1) + x3 (-y0 + y1) - (x0 - x1) (y2 - y3)) (py (x0 - x3) + x3 y0 - x0 y3 + px (-y0 + y3)) -> AA
    // 4 (-dx01 dy23 + dy01 x2 - dy01 x3) (-dy03 px + dx03 py + x3 y0 - x0 y3) -> AA
    // 4 (dx01 dy23 + dy01 (-x2 + x3)) (dy03 px - dx03 py - x3 y0 + x0 y3) -> AA
    let AA = 4 * (dx01 * dy23 - dy01 * (x2 - x3)) * (dy03 * px - dx03 * py - x3 * y0 + x0 * y3)

    // Sqrt[AA + PP^2] -> SS
    let SS = (AA + PP * PP).squareRoot()

    // py (x0 - x1 + x2 - x3) - x2 y0 + x3 (2 y0 - y1) + x0 (y2 - 2 y3) + x1 y3 + px (-y0 + y1 - y2 + y3) -> BB
    // -((dy01 + dy23) px) + (dx01 + dx23) py - x2 y0 + x3 (dy01 + y0) + x0 (dy23 - y3) + x1 y3 -> BB
    let BB = py * (dx01 + dx23) - px * (dy01 + dy23) - x2 * y0 + x3 * (dy01 + y0) + x0 * (dy23 - y3) + x1 * y3

    // py (-x0 + x1 - x2 + x3) + x2 y0 - x3 y1 + x0 (2 y1 - y2) + px (y0 - y1 + y2 - y3) + x1 (-2 y0 + y3) -> CC
    // (dy01 + dy23) px - (dx01 + dx23) py + x2 y0 - x1 (dy03 + y0) - x3 y1 + x0 (dy12 + y1)
    let CC = px * (dy01 + dy23) - py * (dx01 + dx23) + x2 * y0 - x1 * (dy03 + y0) - x3 * y1 + x0 * (dy12 + y1)

    // py (x0 - x1 + x2 - x3) + 2 x1 y0 - x2 y0 + x3 y1 + x0 (-2 y1 + y2) - x1 y3 + px (-y0 + y1 - y2 + y3) -> EE
    // py (dx01 + dx23) - px (dy01 + dy23) + (dx12 + x1) y0 + x3 y1 - x0 (dy12 + y1) - x1 y3 -> EE
    let EE = py * (dx01 + dx23) - px * (dy01 + dy23) + (dx12 + x1) * y0 + x3 * y1 - x0 * (dy12 + y1) - x1 * y3

    // py (-x0 + x1 - x2 + x3) + x2 y0 + x3 (-2 y0 + y1) + px (y0 - y1 + y2 - y3) - x1 y3 + x0 (-y2 + 2 y3) -> NN
    // px (dy01 + dy23) -  py (dx01 + dx23) + x2 y0 - x3 (dy01 + y0) - x0 (dy23 - y3) - x1 y3 -> NN
    let NN = px * (dy01 + dy23) - py * (dx01 + dx23) + x2 * y0 - x3 * (dy01 + y0) - x0 * (dy23 - y3) - x1 * y3

    // U -> -((BB + SS)/(2 DU))
    let ul = -((BB + SS) / (2 * DU))
    // V -> (CC + SS)/(2 DV)
    let vl = (CC + SS) / (2 * DVL)

    if ul >= 0, ul <= 1, vl >= 0, vl <= 1 {
        return CGPoint(x: ul, y: vl)
    }

    // U -> (NN + SS)/(2 DU)
    let ur = (NN + SS) / (2 * DU)

    // V -> (EE + SS)/(2 DVR)
    let vr = (EE + SS) / (2 * DVR)

    return CGPoint(x: ur, y: vr)
}
