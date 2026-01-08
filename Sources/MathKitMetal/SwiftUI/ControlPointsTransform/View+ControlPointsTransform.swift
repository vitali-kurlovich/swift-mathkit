//
//  View+ControlPointsTransform.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 7.01.26.
//

import MathKit
import SwiftUI

public extension View {
    func controlPoints(p0: CGVector, p1: CGVector, p2: CGVector, p3: CGVector, isEnabled: Bool = true) -> some View {
        modifier(ControlPointsModifier(p0: p0, p1: p1, p2: p2, p3: p3, isEnabled: isEnabled))
    }
}

struct ControlPointsModifier: ViewModifier {
    let p0: CGVector
    let p1: CGVector
    let p2: CGVector
    let p3: CGVector
    let isEnabled: Bool

    func body(content: Content) -> some View {
        content.shaderEffect(
            ControlPointsTransformShader(p0: p0, p1: p1, p2: p2, p3: p3),
            isEnabled: isEnabled
        )
    }
}

@available(iOS 18.0, *)
@available(macOS 15.0, *)
#Preview {
    ZStack {
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
                p0: .init(dx: -30, dy: 50),
                p1: .init(dx: 30, dy: -60),
                p2: .init(dx: 10, dy: 100),
                p3: .init(dx: 40, dy: -50)
            )
    }.frame(width: 400, height: 400)
        .padding(88)
}
