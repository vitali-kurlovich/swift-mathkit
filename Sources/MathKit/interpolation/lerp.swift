//
//  lerp.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 24.12.25.
//

public func lerp<R: FloatingPoint>(_ v0: R, _ v1: R, t: R) -> R {
    v0 + t * (v1 - v0)
}
