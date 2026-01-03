//
//  CheckerboardShader.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 2.01.26.
//

import SwiftUI

public struct CheckerboardShader: ColorEffectShaderProvider, Sendable {
    public var checkerSize: CGFloat
    public var checkerOpacity: CGFloat

    public init(checkerSize: CGFloat = 10, checkerOpacity: CGFloat = 0.1) {
        self.checkerSize = checkerSize
        self.checkerOpacity = checkerOpacity
    }

    public func shader(_: GeometryProxy) -> Shader {
        Shader(
            function: shaderFunction(for: "checkerboard"),
            arguments: [.float(checkerSize), .float(checkerOpacity)]
        )
    }
}

#Preview {
    RoundedRectangle(cornerSize: .init(width: 200, height: 166))
        .fill(.green)
        .shaderEffect(CheckerboardShader(checkerSize: 66))
}
