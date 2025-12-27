//
//  transform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 24.12.25.
//

import struct Foundation.CGPoint

func transform(p0: CGPoint, p1: CGPoint, p2: CGPoint, p3: CGPoint, uv: CGPoint) -> CGPoint {
    lerp(lerp(p0, p1, t: uv.x), lerp(p3, p2, t: uv.x), t: uv.y)
}
