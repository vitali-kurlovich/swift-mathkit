//
//  AffineTransform+Utils.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 31.12.25.
//

import Foundation

extension AffineTransform {
    static var rotate45: AffineTransform {
        .rotate(45)
    }

    static var rotate90: AffineTransform {
        .rotate(90)
    }

    static var rotate180: AffineTransform {
        .rotate(180)
    }

    static var rotate270: AffineTransform {
        .rotate(270)
    }

    static var flipHorizontal: AffineTransform {
        .scale(x: 1, y: -1)
    }

    static var flipVertical: AffineTransform {
        .scale(x: -1, y: 1)
    }
}

extension AffineTransform {
    static func translate(x: CGFloat, y: CGFloat) -> Self {
        .init(translationByX: x, byY: y)
    }

    static func scale(_ scalar: CGFloat) -> Self {
        .init(scale: scalar)
    }

    static func scale(x: CGFloat, y: CGFloat) -> Self {
        .init(translationByX: x, byY: y)
    }

    static func rotate(_ angle: CGFloat) -> Self {
        .init(rotationByDegrees: angle)
    }
}

extension AffineTransform {
    func translated(x: CGFloat, y: CGFloat) -> Self {
        var tr = self
        tr.prepend(.translate(x: x, y: y))
        return self
    }

    func scaled(_ scalar: CGFloat) -> Self {
        var tr = self
        tr.prepend(.scale(scalar))
        return self
    }

    func scaled(x: CGFloat, y: CGFloat) -> Self {
        var tr = self
        tr.prepend(.scale(x: x, y: y))
        return self
    }

    func rotated(_ angle: CGFloat) -> Self {
        var tr = self
        tr.prepend(.rotate(angle))
        return self
    }
}
