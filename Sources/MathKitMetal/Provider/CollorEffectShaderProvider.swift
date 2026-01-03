//
//  CollorEffectShaderProvider.swift
//  swift-mathkit
//
//  Created by Vitali Kurlovich on 3.01.26.
//

import SwiftUI

public protocol CollorEffectShaderProvider: ShaderProvider {
    func shader(content: EmptyVisualEffect, proxy: GeometryProxy) -> Shader
}
