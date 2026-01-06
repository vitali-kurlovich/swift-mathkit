//
//  View+ControlPointsTransform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 7.01.26.
//

import MathKit
import SwiftUI

public extension View {
    func controlPoints(_ transform: ControlPointsTransform) -> some View {
        modifier(ControlPointsModifier(transform))
    }

    func controlPoints(p0: CGPoint, p1: CGPoint, p2: CGPoint, p3: CGPoint) -> some View {
        modifier(ControlPointsModifier(p0: p0, p1: p1, p2: p2, p3: p3))
    }
}

struct ControlPointsModifier: ViewModifier {
    var transform: ControlPointsTransform

    @Environment(\.displayScale)
    var displayScale: CGFloat

    init(_ transform: ControlPointsTransform) {
        self.transform = transform
    }

    func body(content: Content) -> some View {
        content.shaderEffect(
            ControlPointsTransformShader(transform, displayScale: displayScale)
        )
    }
}

extension ControlPointsModifier {
    init(p0: CGPoint, p1: CGPoint, p2: CGPoint, p3: CGPoint) {
        let transform = ControlPointsTransform(p0: p0, p1: p1, p2: p2, p3: p3)
        self.init(transform)
    }
}

@available(iOS 18.0, *)
@available(macOS 15.0, *)
#Preview {
    RoundedRectangle(cornerSize: .init(width: 120, height: 120))
        .fill(.indigo.secondary)
        .overlay {
            Image(systemName: "heart.circle.fill")
                .symbolRenderingMode(.palette)
                .foregroundStyle(.yellow, .green, .red.gradient)
                .font(.system(size: 220, weight: .semibold))
                .symbolEffect(.breathe)
        }
        .geometryGroup()
        .controlPoints(
            p0: .init(x: 20, y: 0),
            p1: .init(x: 200, y: 40),
            p2: .init(x: 90, y: 166),
            p3: .init(x: 30, y: 120)
        )
}
