//
//  CoordinateSpace.swift
//  MathKitApp
//
//  Created by Vitali Kurlovich on 8.01.26.
//

import Foundation
import SwiftUI

nonisolated struct CoordinateSpace: Equatable {
    let _transform: AffineTransform
}

extension CoordinateSpace {
    init() {
        self.init(_transform: .identity)
    }

    init(from: Self, to: Self) {
        var transform = from._transform

        transform.invert()
        transform.prepend(to._transform)

        self.init(_transform: transform)
    }
}

// proxy: GeometryProxy

extension CoordinateSpace {
    init(_ proxy: GeometryProxy) {
        self.init(local: proxy.frame(in: .local), global: proxy.frame(in: .global))
    }
}

extension CoordinateSpace {
    init(local: CGRect, global: CGRect) {
        let result: AffineTransform

        let offset = local.origin - global.origin

        if local == global {
            result = .identity
        } else if local.size == global.size {
            result = .init(translationByX: offset.x, byY: offset.y)
        } else {
            let scaleX = local.size.width / global.size.width
            let scaleY = local.size.height / global.size.height

            var transform: AffineTransform = .init(scaleByX: scaleX, byY: scaleY)
            transform.translate(x: offset.x, y: offset.y)

            result = transform
        }

        self.init(_transform: result)
    }

    init(local: CGPoint, global: CGPoint) {
        self.init(local: .init(origin: local, size: .zero), global: .init(origin: global, size: .zero))
    }

    func transform(_ point: CGPoint) -> CGPoint {
        _transform.transform(point)
    }

    func inverseTransform(_ point: CGPoint) -> CGPoint {
        guard let tr = _transform.inverted() else {
            assertionFailure("inverted must not be nil")
            return point
        }

        return tr.transform(point)
    }

    func transform(_ rect: CGRect) -> CGRect {
        transform(rect, tr: _transform)
    }

    func inverseTransform(_ rect: CGRect) -> CGRect {
        guard let tr = _transform.inverted() else {
            assertionFailure("inverted must not be nil")
            return rect
        }

        return transform(rect, tr: tr)
    }

    private func transform(_ rect: CGRect, tr: AffineTransform) -> CGRect {
        let p0 = CGPoint(x: rect.minX, y: rect.minY)
        let p1 = CGPoint(x: rect.maxX, y: rect.minY)
        let p2 = CGPoint(x: rect.maxX, y: rect.maxY)
        let p3 = CGPoint(x: rect.minX, y: rect.maxY)

        return bounds(p0: tr.transform(p0),
                      p1: tr.transform(p1),
                      p2: tr.transform(p2),
                      p3: tr.transform(p3))
    }

    private func bounds(p0: CGPoint, p1: CGPoint, p2: CGPoint, p3: CGPoint) -> CGRect {
        let minX = min(p0.x, p1.x, p2.x, p3.x)
        let maxX = max(p0.x, p1.x, p2.x, p3.x)

        let minY = min(p0.y, p1.y, p2.y, p3.y)
        let maxY = max(p0.y, p1.y, p2.y, p3.y)

        return .init(x: minX, y: minY, width: maxX - minX, height: maxY - minY)
    }
}
